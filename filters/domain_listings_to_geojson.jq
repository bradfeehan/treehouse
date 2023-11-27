{
    type: "FeatureCollection",
    features: [
        # (map(select(.type == "PropertyListing")) | map(.listing)),
        # (map(select(.type == "Project")) | map(.listings))
        (.[] | select(.type == "PropertyListing") | .listing),
        (.[] | select(.type == "Project") | .listings[])
     ] | flatten | map({
        type: "Feature",
        geometry: {
            type: "Point",
            coordinates: [
                .propertyDetails.longitude,
                .propertyDetails.latitude
            ]
        },
        properties: {
            domain_id: .id,
            domain_slug: .listingSlug,
            type: .listingType,
            imageURLs: (if has("media") then [.media[] | select(.category == "Image") | .url] else [] end),
            price_details: .priceDetails,
            address: {
                display: .propertyDetails.displayableAddress,
                unit: .propertyDetails.unitNumber,
                number: .propertyDetails.streetNumber,
                street: .propertyDetails.street,
                area: .propertyDetails.area,
                region: .propertyDetails.region,
                suburb: .propertyDetails.suburb,
                postcode: .propertyDetails.postcode,
                formatted: (
                    (if .propertyDetails.unitNumber == "" then "" else .propertyDetails.unitNumber + "/" end)
                    + .propertyDetails.streetNumber + " "
                    + .propertyDetails.street + ", "
                    + .propertyDetails.suburb + ", "
                    + .propertyDetails.postcode
                )
            }
        }
    })
}
