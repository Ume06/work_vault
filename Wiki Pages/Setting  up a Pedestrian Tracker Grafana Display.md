# Setting Up a Pedestrian Tracker Dashboard

### What you need:
1. List of edges and all relevant information:
	   1. ID
	   2. location
	   3. address
2. Project Code
3. Access to smart cities database
4. Access to Grafana 8

### Step 1: Add devices to database

1. Navigate to the devices table in the smart cities database
2. Add all edge units as new rows in the table filling out all relevant information
3. Follow the [[Naming devices on SAGE Smart-Cities DB]] to name the device
4. The description column is how the device will appear on the dashboard, ensure that it will be identifiable by the client
5. Save the new rows in the table

### Step 2: Create Dashboard

> [!info] If it does not already exist, you will need to create a new organisation for the client

1. Find the SAGE Edge template in the SAGE Automation dashboard and open it
> [!tip]
> You can test if your devices have been added correctly by typing you project code into the variable at the top of the page
2. navigate into the settings > JSON model and copy the created JSON object
3. navigate to the organisation that the dashboard will be in and select 'import new dashboard' from the '+' icon menu
4. past the JSON into the input box and load the new dashboard

### Step 3: Configure new dashboard
1. navigate into the variables in the settings menu and update the project code, then hide all variables except sites
2. for the map module, open the edit menu and change the default location to where your edge(s) will be set up
3. validate that the dashboard is displaying the correct data
4. finally, save changes you have made