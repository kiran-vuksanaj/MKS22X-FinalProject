# MKS22X-FinalProject
displaying a map with datapoints!

## Project Description


## Directions
### To Use the Map:
1. First, you need to download a data set as a CSV file and put it into the folder labeled 'inputFiles'. Some sample datasets are listed below, and there is also one already in inFiles, called 'Subway_Entrances_Sample.csv'.
2. Run the program and type the name of the file you wish to display. Press enter once finished typing.
3. A menu will show up, which has all of the different data fields you can present when you view a specific point on the map. Click on whichever fields you wish to display.
4. Press 'SUBMIT' when you've chosen the desired fields. A map of New York City will show up.
5. With our map, you can move around and zoom using a few different methods.
- Zoom in and out by clicking the '+' and '-' buttons on the lower left hand corner of the screen.
- View different parts of the map by clicking and dragging your mouse on the window.
- Reset the zoom and view by clicking the circle button in the lower left hand corner of the screen.
6. To switch between Point View and Density View, press the up arrow key.

### Sample Data Sets
- Any NYC csv dataset that has 'the_geom' as the first column header and the data in that column formatted as 'DATA(<latitude>, <longitude>)' should work in our map
- https://data.cityofnewyork.us/Transportation/Parking-Meters-GPS-Coordinates-and-Status/5jsj-cq4s which shows all of the parking meters in NYC.
- https://data.cityofnewyork.us/Recreation/New-York-City-Art-Galleries/tgyc-r5jh which shows all of the art galleries in NYC.
- https://data.cityofnewyork.us/Social-Services/After-School-Programs/6ej9-7qyi which is a map of all of the places in NYC that provide after school programs.
- https://data.cityofnewyork.us/resource/2hzz-95k8.json which is a map or all of the theaters in NYC.



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

### Wednesday, May 29
- Emory: Making changes in the design of Kiran's menu; no longer crashes when you enter the incorrect filename it let's you correct it; experimenting still with clicking on each point (I'm having trouble figuring out where each latitude and longitude point are translated to on the window's) coordinate map

### Thursday, May 30
- Emory: Made sure that the choices in the menu will not exceed the length of the page; changed certain parts of the menu and added directions; tested map with a new file; we can now click on a point and a rectangle shows up
- Kiran: Researched the way mouseX and mouseY work, in order to be able to correct them to the right location, building a correctX() and correctY() method for use in popups.

### Friday, May 31
- Kiran: Tried to figure out how geoJSON formats work (no commits during class);
- Emory: Played around with the format of our popups; figured out how to get it to stay on the screen until another area is pressed;

### Sunday, June 2
- Emory: Fixed a bug in the popups, where multiple were popping up on points that were not clicked; experimented with putting the point data in the popups but having trouble figuring out where to store that;

### Monday, June 3
- Emory: Tried to find a way to make the popups resize according to the scale but didn't find a good solution; still trying to figure out how to display the point data into the popups;
