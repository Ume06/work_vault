## Key Deliverables

1. O/D Matrix using .det data
2. TRIPS Table using .det data
3. Map out Sites and Zones

## Tasks Completed

**aggregate detector data**: collate detector data from customer supplied files. Files are filtered down to only include relevant data and aggregated for 15 minute windows
**generate od matrix**: aggregated data is converted into an od matrix, in a single excel doc, with each sheet representing a 15 minute window. 
**generate trips table**: by reformatting the volume data into detector groups, movements between zones can be inferred from lane data. Departure time for larger volumes over a single detector are broken down into into even intervals inside the collection period.
**map connections between sites and zones**: by using the supplied location list of sites and zones, as well as the SCATS graphic data, I have manually inferred travel between zones based on detector ids. This allows me to generate the trips table and od matrix on a zone or tcs site basis