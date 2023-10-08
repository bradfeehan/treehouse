# Directory where the input query files are located
QUERY_DIR := queries
# Directory where the raw responses from Overpass API should be saved
OUTPUT_DIR := results
# Directory where the output geojson files should be saved
DATA_DIR := data

# Overpass API endpoint
OVERPASS_API := "https://overpass-api.de/api/interpreter"
# Path to the osmtogeojson binary in node_modules
OSMTOGEOJSON := ./node_modules/.bin/osmtogeojson

# Finds all the .overpass files in the QUERY_DIR
SOURCES := $(wildcard $(QUERY_DIR)/*.overpass)
# Generates a list of target .xml filenames based on the source filenames
RESULTS := $(patsubst $(QUERY_DIR)/%.overpass,$(OUTPUT_DIR)/%.xml,$(SOURCES))
TARGETS := $(patsubst $(QUERY_DIR)/%.overpass,$(DATA_DIR)/%.geojson,$(SOURCES))

# The default target
all: $(RESULTS) $(TARGETS)

# Rule to make the output .geojson files from the source .overpass files
$(DATA_DIR)/%.geojson: $(OUTPUT_DIR)/%.xml
	@mkdir -p "$(DATA_DIR)"
	$(OSMTOGEOJSON) -f osm -v $(<) > $(@)

# Rule to make the output .geojson files from the source .overpass files
$(OUTPUT_DIR)/%.xml: $(QUERY_DIR)/%.overpass
	@mkdir -p "$(OUTPUT_DIR)"
	curl --location --silent --show-error --request POST --data @$(<) $(OVERPASS_API) --output $(@)

# A phony target for cleaning up the generated files
clean:
	@for target in $(RESULTS) $(TARGETS); do \
		rm -f "$$target"; \
	done

.PHONY: all clean
