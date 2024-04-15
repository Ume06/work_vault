# RAA Go - Tables

---

1. [[#Docker User DB]]
	1. [[#Users]]
	2. [[#Journeys]]
	3. [[#Validate User]]
	4. [[#Recent Locations]]
	5. [[#Events]]
2. [[#Docker Timescale DB]]
	1. [[#Adl Metro Stops]]
	2. [[#Trips]]
	3. [[#Vehicles]]
	4. [[#Adl Metro Vehicles]]
	5. [[#Fuel Price]]
	6. [[#Fuel Site]]
	7. [[#Fuel Type]]
	8. [[#SVG]]
	9. [[#Tickets]]
	10. [[#Pricing]]
	11. [[#Fuel Audit]]
	12. [[#Vehicle Audit]]
	13. [[#Off Street Parking]]
	14. [[#Geo-Fences]]
	15. [[#Stops]]
	16. [[#Bookings]]
	17. [[#Profile]]

---

The tar file sent in the data transfer to Shane Babiak contains the postgres dump of the tables described mentioned in this documentation
## Docker User DB

### Users
**table name**: public.users.
User details associated with RAA Go accounts

| column              | data type            |
| ------------------- | -------------------- |
| userid              | uuid not null        |
| deviceid            | uuid                 |
| firstname           | text                 |
| lastname            | text                 |
| email               | text                 |
| phone               | text                 |
| gender              | varchar              |
| dateofbirth         | date                 |
| priorities          | jsonb                |
| modes               | jsonb                |
| isambulant          | bool                 |
| createdat           | timestamptz not null |
| updatedat           | timestamptz not null |
| app_preferences     | jsonb                |
| jounrey_preferences | jsonb                |

### Journeys
**table Name**: public.journeys
history of generated journeys associated with users

| column          | data type              |
| --------------- | ---------------------- |
| journeyid       | uuid not null          |
| userid          | uuid not null          |
| status          | text                   |
| journey         | jsonb                  |
| journeyhash     | text                   |
| previousversion | uuis                   |
| createdat       | timestamptz not null   |
| updatedat       | timestamptz not null   |
| currenttrip     | numeric                |
| cerrentstep     | numeric                |
| currentlocation | jsonb                  |
| PRIMARY KEY     | (journeyid, createdat) |

### Recent Locations
**table Name**: public.recentlocations
google locations data that users have searched for in the app (e.g. origin destination)

| column      | data type            |
| ----------- | -------------------- |
| id          | uuid not null        |
| userid      | uuid not null        |
| createdat   | timestamptz not null |
| type        | varchar              |
| title       | carchar              |
| subtitle    | carchar              |
| location    | jsonb                |
| PRIMARY KEY | (id)                 |

### Validate User
**table Name**: public.validateuser
stores validation codes for users to login via app

| column         | data type            |
| -------------- | -------------------- |
| checkid        | uuid not null        |
| deviceid       | uuid                 |
| phone          | text                 |
| validationcode | numeric              |
| createdat      | timestamptz not null |
| attempts       | numeric not null     |
| status         | numeric not null     |

### Events
**table Name**: public.events
stores app usage metrics such as login sessions and time used, pages visited, etc.

| column     | data type            |
| ---------- | -------------------- |
| time       | timestamptz not null |
| userid     | uuid not null        |
| deviceid   | uuid not null        |
| eventtype  | varchar not null     |
| eventvalue | varchar not null     |
| metadata   | jsonb                |

---

## Docker Timescale DB

### Adl Metro Stops
**table name**: adlmetro.stops
list of public transit stops (bus, train, tram)

| Column              | Data Type |
| ------------------- | --------- |
| stop_id             | text      |
| stop_code           | text      |
| stop_name           | text      |
| stop_desc           | text      |
| stop_lat            | numeric   |
| stop_lon            | numeric   |
| zone_id             | text      |
| stop_url            | text      |
| location_type       | text      |
| parent_station      | text      |
| stop_timezone       | text      |
| wheelchair_boarding | text      |

### Trips
**table name**: adlmetro.trips
public transit trips.  Unused in production

| Column                | Data Type |
| --------------------- | --------- |
| route_id              | text      |
| service_id            | text      |
| trip_id               | text      |
| trip_headsign         | text      |
| trip_short_name       | text      |
| direction_id          | int4      |
| block_id              | text      |
| shape_id              | text      |
| wheelchair_accessible | text      |
### Adl Metro Vehicles
**table name**: adlmetro.vehicles
vehicle location information. unused in production

| Column    | Data Type        |
|-----------|------------------|
| vehicleId | text PRIMARY KEY |
| mode      | text             |
| status    | text             |
| provider  | text             |
| location  | jsonb            |
| svgref    | int4             |
| extended  | jsonb            |
### Vehicles
**table name**: public.vehicles
stores all vehicle information from all providers.  Previously utilised different schemas for airbike until they implemented gtfs.  Now airbike.bikes is no longer utilised.

| Column     | Data Type        |
|------------|------------------|
| vehicleId  | text PRIMARY KEY |
| mode       | text             |
| status     | text             |
| provider   | text             |
| location   | jsonb            |
| svgref     | int4             |
| extended   | jsonb            |
| brand      | text             |
| notes      | text             |
| make       | text             |
| fuel       | text             |
| charge     | numeric          |
| remaining  | numeric          |
| unit       | text             |
| priceid    | text             |
| licence    | text             |
| passengers | numeric          |
| address    | text             |
| uri        | jsonb            |

### Fuel Price
**table name**: public.fuelprice
stores fuel station price data

| Column             | Data Type           |
|--------------------|---------------------|
| unique             | numeric PRIMARY KEY |
| siteid             | numeric             |
| fuelid             | numeric             |
| collectionmethod   | text                |
| transactiondateutc | timestamp           |
| price              | numeric             |

### Fuel Site
**table name**: public.fuelsite
stores fuel station location data

| Column     | Data Type           |
|------------|---------------------|
| siteid     | numeric PRIMARY KEY |
| address    | text                |
| name       | text                |
| lat        | numeric             |
| lon        | numeric             |
| gpi        | text                |
| brand_name | varchar             |

### Fuel Type
**table name**: public.fueltype
stores fuel station fuel types data (e.g. unleaded, diesel, etc)

| Column      | Data Type           |
|-------------|---------------------|
| fuelid      | numeric PRIMARY KEY |
| name        | text                |
| displayname | text                |

### SVG
**table name**: public.svg
not used in production

| Column   | Data Type        |
|----------|------------------|
| svgref   | int4 PRIMARY KEY |
| svg      | text             |
| provider | text             |
### Tickets
**table name**: public.tickets
not used in production.  Dev table for demonstrating ticketing capabilities with public transit.

| Column         | Data Type            |
|----------------|----------------------|
| userid         | uuid NOT NULL        |
| ticketid       | uuid PRIMARY KEY     |
| tickettype     | text                 |
| activationtime | timestamptz          |
| createdat      | timestamptz NOT NULL |
| updatedat      | timestamptz NOT NULL |
| concession     | text                 |
### Pricing
**table name**: public.pricing
pricing data for vehicles (e.g. escooters)

| Column      | Data Type        |
|-------------|------------------|
| id          | varchar NOT NULL |
| provider    | text NOT NULL    |
| currency    | text             |
| description | varchar          |
| taxable     | boolean          |
| pricing     | jsonb            |
| price       | numeric          |

### Fuel Audit
**table name**: public.fuelaudit
stores information on when entries for fuel data were updated

| Column    | Data Type            |
|-----------|----------------------|
| id        | uuid PRIMARY KEY     |
| updatedat | timestamptz NOT NULL |
| type      | text                 |
| item      | text                 |
| operation | text                 |

### Vehicle Audit
**table name**: public.vehiclaudit
stores information on when entries for vehicles were updated

| Column    | Data Type            |
|-----------|----------------------|
| id        | uuid PRIMARY KEY     |
| updatedat | timestamptz NOT NULL |
| provider  | text                 |
| item      | text                 |
| operation | text                 |

### Off Street Parking
**table name**: public.offstreetparking
stores offstreet park information of partnered parking services around Adelaide

| Column           | Data Type |
|------------------|-----------|
| provider         | text      |
| site             | text      |
| building         | text      |
| street           | text      |
| city             | text      |
| state            | text      |
| postCode         | numeric   |
| entries          | text[]    |
| exits            | text[]    |
| lat              | numeric   |
| lon              | numeric   |
| openAllDay       | boolean   |
| openAllYear      | boolean   |
| totalSpaces      | numeric   |
| disabledParking  | boolean   |
| wheelchairAccess | boolean   |
| website          | text      |
| logo             | text      |
| deeplinkIOS      | text      |
| deeplinkAndroid  | text      |
| storeIOS         | text      |
| storeAndroid     | text      |
| occupancyFeed    | text      |
| levels           | numeric   |
| entryPhoto       | text      |

### Geo-Fences
**table name**: public.geofences
geofence data for vehicles, used to determine where vehicles can operate within

| Column       | Data Type        |
|--------------|------------------|
| provider     | text PRIMARY KEY |
| name         | text PRIMARY KEY |
| vehicletypes | text[]           |
| feature      | jsonb NOT NULL   |

### Stops
**table name**: public.stops
formatted public transit stop information for display on RAA Go homescreen map.  Helps differentiate some stop types.

| Column    | Data Type |
| --------- | --------- |
| vehicleid | text      |
| provider  | text      |
| status    | text      |
| location  | jsonb     |

### Bookings
**table name**: tsp.bookings
unused

| Column      | Data Type                      |
|-------------|--------------------------------|
| bookingId   | uuid PRIMARY KEY               |
| state       | varchar                        |
| price       | numeric                        |
| includeGST  | boolean                        |
| signupEvent | boolean DEFAULT FALSE NOT NULL |
| provider    | varchar NOT NULL               |
| time        | timestamp NOT NULL             |
| referral    | varchar                        |

### Profile
**table name**: tsp.profile
unused

| Column                  | Data Type        |
|-------------------------|------------------|
| name                    | text NOT NULL    |
| brandIdLrg              | text             |
| brandIdSml              | text             |
| primaryColour           | text             |
| pinBackground           | text             |
| images                  | jsonb            |
| providerId              | varchar NOT NULL |
| endpointRootURL         | text             |
| gbfsMinimumPollInterval | numeric          |