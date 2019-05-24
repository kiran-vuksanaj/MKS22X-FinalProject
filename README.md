# MKS22X-FinalProject
displaying a map with datapoints!


## Daily Logs
### Sunday, May 19
- Emory: Started to work on the ZoomButton class(Part 1D); wrote the draw method but still need to actually make it zoom in and out
- Kiran: configurued files to uml for easy branching; wrote code to parse CSV; used that to extract data for background regions from NTA file (Part 1A)

### Monday, May 20
- Emory: Added a draw method for the neighborhoods that creates a polygon with all corners; set instance variables for the edges of the map; created the actual map; shows all of nyc flipped
- Kiran: Examined file formatting of NYC Open Data's CSV files in order to setup CSV parsing

### Tuesday, May 21
- Emory: Scaled the coordinates to the processing coordinate systems through processing transformations; realized my previous error: the lines of the neighborhood outlines get scaled as well so I was getting a big blob of blackness; changed the size of the lines and now working.
- Kiran: Realized a problem in earlier interpretation of base file formatting; rewrote majority of parsing code to correct errors, mirror the complete structure of multipolygons, and updated storage to use doubles rather than floats.

### Wednesday, May 22
- Emory: Finished zoom buttons; also made a button that will reset the zoom of the map;
- Kiran: Fleshed out CSVFile class to parse data and extract the proper information for datapoints

### Thursday, May 23
- Emory: AP US History Exam
- Kiran: Wrote code to display points and fiddled with sizes and scales to make them look good; flipped the map right side up


### Friday, May 24
- Emory: Trying to make the map move by dragging; running into some trouble where the map just disappears when I drag
