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
- Emory: Finished zoom buttons they zoom in and out based on the upper left hand corner; also made a button that will reset the zoom of the map;
- Kiran: Fleshed out CSVFile class to parse data and extract the proper information for datapoints

### Thursday, May 23
- Emory: AP US History Exam
- Kiran: Wrote code to display points and fiddled with sizes and scales to make them look good; flipped the map right side up

### Friday, May 24
- Emory: Trying to make the map move by dragging; running into some trouble where the map just disappears when I drag; experimented with moving a box around in a separate file; moves but is moving the opposite direction of where I drag
- Kiran: Researched how to determine what region points fall into in order to calculate neighborhood density

### Saturday, May 25
- Kiran: Corrected issues in Emory's drag; Wrote code to determine which region any given point falls in; wrote code to calculate the density of points for any particular neighborhood and then displayed it through a grayscale heatmap; created ability to shift between 'point' mode and 'density' mode by holding down up key

### Sunday, May 26
- Emory: Created a label explaining how to access the density map in the top left corner of the interface;

### Monday, May 27
- Emory: Created a scale reference for the density map showing what each color means; changed how far one can zoom in on the map;

### Tuesday, May 28
- Emory : Starting to work with the popups for each point; trying to figure out how to click on each individual point
- Kiran : (includes a couple of commits past midnight) Designed and then built a menu in order to select an arbitrary file and columns within it for which data to display in popups; accesses file named in text box, allows user to choose relevant columns, upon submit launches the normal map (still needs some design changes)

