# Directory where the input query files are located
QUERY_DIR := queries
# Directory where the raw responses from Overpass API should be saved
OUTPUT_DIR := results
# Directory where the output geojson files should be saved
DATA_DIR := data
# Directory containing API clients
CLIENTS_DIR := clients
# Directory with files describing JQ filters/commands
FILTERS_DIR := filters

# Overpass API endpoint
OVERPASS_API := "https://overpass-api.de/api/interpreter"
# Path to the osmtogeojson binary in node_modules
OSMTOGEOJSON := ./node_modules/.bin/osmtogeojson

# Domain.com.au API
DOMAIN_CLIENT := $(CLIENTS_DIR)/domain
DOMAIN_SOURCES := $(wildcard $(QUERY_DIR)/*.domain.json)
DOMAIN_RESULTS := $(patsubst $(QUERY_DIR)/%.domain.json,$(OUTPUT_DIR)/%.domain.json,$(DOMAIN_SOURCES))
DOMAIN_TARGETS := $(patsubst $(QUERY_DIR)/%.domain.json,$(DATA_DIR)/%.geojson,$(DOMAIN_SOURCES))

# Finds all the .overpass files in the QUERY_DIR
OVERPASS_SOURCES := $(wildcard $(QUERY_DIR)/*.overpass)
# Generates a list of target .xml filenames based on the source filenames
OVERPASS_RESULTS := $(patsubst $(QUERY_DIR)/%.overpass,$(OUTPUT_DIR)/%.xml,$(OVERPASS_SOURCES))
OVERPASS_TARGETS := $(patsubst $(QUERY_DIR)/%.overpass,$(DATA_DIR)/%.geojson,$(OVERPASS_SOURCES))
OSM_PBF := docker/data/osm_file.pbf
GTFS_ZIP := docker/data/gtfs.zip

# The default target
all: $(OVERPASS_RESULTS) $(OVERPASS_TARGETS) $(DOMAIN_RESULTS) $(DOMAIN_TARGETS) $(OSM_PBF) $(GTFS_ZIP)

# Rule to make the output .geojson files from the result .xml files
$(DATA_DIR)/%.geojson: $(OUTPUT_DIR)/%.xml
	@mkdir -p "$(DATA_DIR)"
	$(OSMTOGEOJSON) -f osm -v $(<) > $(@)

# Rule to make the result .xml files from the source .overpass files
$(OUTPUT_DIR)/%.xml: $(QUERY_DIR)/%.overpass
	@mkdir -p "$(OUTPUT_DIR)"
	curl --location --silent --show-error \
		--request POST --data @$(<) $(OVERPASS_API) --output $(@)

# Rule to make the output .geojson files from the result .domain.json files
$(DATA_DIR)/%.geojson: $(OUTPUT_DIR)/%.domain.json
	@mkdir -p "$(DATA_DIR)"
	jq --slurp --from-file $(FILTERS_DIR)/domain_listings_to_geojson.jq $(<) > $(@)

$(OUTPUT_DIR)/%.domain.json: $(QUERY_DIR)/%.domain.json
	@mkdir -p "$(OUTPUT_DIR)"
	$(DOMAIN_CLIENT) $(<) $(@)

$(OSM_PBF):
	@mkdir -p docker/data
	curl --location --output $(@) --show-error \
	  'https://download.bbbike.org/osm/bbbike/Melbourne/Melbourne.osm.pbf'

$(GTFS_ZIP):
	@mkdir -p docker/data
	curl --location --output $(@) --show-error \
	  'https://data.ptv.vic.gov.au/downloads/gtfs.zip'

# A phony target for cleaning up the generated files
clean:
	@for target in $(RESULTS) $(OVERPASS_TARGETS) $(DOMAIN_TARGETS); do \
	  rm -f "$$target"; \
	done

.PHONY: all clean
