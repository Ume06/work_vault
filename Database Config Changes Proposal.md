### Problem
devices currently are given to multiple clients. This means that for a client that no longer has an active device in the database is difficult to retrieve their associated data, as old device entries need to be deleted to make room for a device entry for a new client.

### Proposed Solution
By abstracting the relational structure away from bt numbers and using a separate id value instead, multiple devices can have the same bt number, and still have the correct data associated with them. This will require using an active date range, in which the device is recording data. This can be entered on device creation. End date should also be able to be edited retro-actively. The data ingestor should be able to assign the correct foreign key based on which device is active. A simplified schema is shown below. 

![[Pasted image 20250408114739.png]]