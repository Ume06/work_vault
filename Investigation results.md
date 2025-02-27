### concerns:
- No dashboard data for following:
	- 31 **
	- 35
	- 39
	- 44
	- 46 **
- wrong location
	- 17
- share same location name
	- 34, 35
	- fixed - 34 is Bonython Park
	- mixup with site-installation notes
	- names have been fixed, coordinates will be checked by C.O.B Friday
24E124126E033003 - co2 measurement not occuring
24E124126E033503 - empty payloads, last proper one 14th dec
24E124126E037035 - empty payloads, last proper one 6th nov
24E124126E030382 - last report 23 july 2024
24E124126E030974 - co2 measurement not occuring

31/46 outed by query conditions

31 - last measurement two days ago
46 - ttn has recorded measurement but has not input to database?

### Results:
- naming and location concerns have been investigated and fixed. 
	- result of misinterpreting site installation notes
	- fix was renaming and adjusting location of affected devices
- non-recording devices:
	- 31, 35, 39: sending empty packets to server
	- 46: database not ingesting data
	- 44: no communicated since 23/07/2024

- currently working on a fix for 46
- 31, 35, and 39 are most likely connectivity issues
- 44 is most likely a hardware issue.

T<sub>ij</sub> = A<sub>j</sub> / 
