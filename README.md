treehouse
=========

Finding a place to live with QGIS.

The Idea
--------

I wanna find a place to live and have a bunch of criteria, but it's complicated. Like, I want to live close to a
supermarket, but don't care which one. I want to live near a train station but not right next to a train line.

### Layers

The main idea is to visualise possible places to live on a map, showing pins for each rental listing, with layers as
overlays. Each layer represents the desirability of some characteristic across each location in the map. The layers
would be like two-dimensional [scalar fields], visualised as a colour overlay.

[scalar fields]: <https://en.wikipedia.org/wiki/Scalar_field>

I have different ideas for how to define the layers; maybe as a mathematical function, like the inverse square of the
straight-line distance to a specific address (e.g. the user's workplace, school, etc). Or the minimum distance to any
of a set of discrete points (e.g. if I have a collection of locations of supermarkets, or even a continuous region such
as the beach).

### Metrics

Some examples of the types of metrics that could be measured in a layer:

- Proximity to locations in a set
    - Count within a given radius
    - Distance to nearest in the set
    - Travel time to nearest in the set
- Quality of internet service available
    - Wireless/cellular coverage
    - Perform an address check for an ISP, NBN, etc.
- TODO: many others

### Coefficients

The aim is then to combine multiple layers into a visual summary, with relative weights determined with specific
coefficients for each layer, which can be positive or negative.

For example, living near a train station offers convenient transport, warranting a positive coefficient. However,
proximity to train lines could mean noise, suggesting a negative coefficient for this metric. In this system, closeness
to a station increases the overall score, while closeness to train lines decreases it.

Folks with different preferences could fine-tune the coefficients relative to each other -- for example, dog owners may
want to live closer to parks than the average person, so they could increase that layer's coefficient to give it more
importance. Changing the sign of a coefficient could make sense too: families with children may find it important to
be near childcare providers, whereas childfree families might find that proximity comes with unwanted extra noise.

## Implementation

### Sets of locations

To generate the data sets of locations used in the various layers:

- Using the OpenStreetMap Overpass API, create a library of queries to fetch a set of locations.
- Running `make` will submit each query to Overpass, saving the results locally.
- The XML output from the Overpass API is converted into GeoJSON format using [`osmtogeojson`].
- These data files are imported into QGIS layers where it can be visualised.

[`osmtogeojson`]: <https://github.com/tyrasd/osmtogeojson>

### OpenRouteService

To generate routes, isochrones, and distance matrices, a self-hosted version of [OpenRouteService] can be set up using
the included Docker Compose configuration:

1. Fetch the latest OpenStreetMap dataset of Melbourne, from [BBBike.org]: `make docker/data/osm_file.pbf`
2. Start the server: `docker-compose up`
3. Wait for the graph to regenerate (should take <30s for Melbourne dataset)

[OpenRouteService]: <https://openrouteservice.org>
[BBBike.org]: <https://download.bbbike.org/osm/>
