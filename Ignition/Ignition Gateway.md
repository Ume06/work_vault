## Gateway Overview
<hr>
##### <u>Gateway Web Page</u>
- accessible via the server address on port 8088.
- Ignition designer launcher can be downloaded to create new project
- Other software downloads / links are available
- Status Section:
	- requires a login
	- highlights different sections of the ignition gateway
	- sections with an issue will be highlighted in red
- Configuration Section:
	- requires a login
	- manage parts of the ignition software
- In Status and Configuration there is a search bar to find relevant sections

##### <u>Password Reset</u>
**requirements**
- be on machine ignition is installed on
- administrator access on machine

**Steps**
1. run command prompt as admin
2. `cd C:\Program Files\Inductive Automation\Ignition`
3. `gwcmd.bat -p`
4. `gwcmd.bat -r`
5. navigate to gateway and create temporary credentials
6. this will change user source and identity provider to new user

## Making Backups and Restoring
<hr>
##### <u>Making Gateway Backups</u>
- only data not stored in backups is data stored in separate software that ignition interacts with, such as SQL databases, and items manually added to an ignition directory

**Backup Via Web Interface**
1. Go to the configure page
2. select back/restore under system
3. download backup

**Scheduling a backup**
1. Go to the configure page
2. select gateway settings
3. under scheduled backup settings the following backup settings can be configured:
	1. Enabling scheduled backups
	2. the backup folder where they will be stored
	3. the schedule for when to backup (default is at 3pm)
	4. the number of backups to retain

**Backup via Command Line Utility**
1. run command prompt as admin
2. `cd C:\Program Files\Inductive Automation\Ignition`
3. `gwcmd.bat -b "$PATH_TO_STORE_BACKUP"`

##### <u>Restoring Gateway Backups</u>
1. Go to the configure page
2. select back/restore under system
3. go to restore tab
4. select the restoration settings
5. choose the backup file and select a previously made backup file
6. everything on the gateway will be overridden upon restoration

* it is also possible via the command line

##### <u>Making Project Backups</u>
**Via Gateway Web Page***
1. Go to the configure page
2. select Projects under system
3. under the actions tab of the project you want to backup
4. select export to download the project as a zip file
	1. Important to note that the .zip file **is** the backup
	2. backwards compatible
5. to restore select import project in the same tab
6. use the zip file to import the back-up project

**Project Backup vs Ignition Gateway Backup**
Ignition Gateway Backup:
- includes everything
- project and tags
- database connections
- authentication profiles
- restoring will override all current settings

Project Backup:
- includes everything unique to the project
- vision or perspective resources
- scripts 
- alarm pipelines
- report
- transactions groups
- can be added as a new project or merged into existing project
- no overriding will occur


## Licensing and Activating Ignition
<hr>

##### <u>Licensing</u>
1. Go to configure page
2. Select Licensing under system 
3. Current applied licensees will be viewable in the Applied Licenses section, as well as the modules under the license
4. The Effective License section shows the modules that are being licensed as part of the system, dependent on the licensed modules installed

##### <u>The Trial Period </u>
1. without a license, the gateway will be in trial mode
2. during this period, full functionality is enabled
3. the following will end when the trial ends:
	1. tag data will stop being pulled from PLC's
	2. unable to launch vision clients
	3. unable to execute reports
	4. projects will still be able to be made
4. you can reset the trial timer for another two hours, and can be done by signing in to the gateway, and selecting 'reset trial'
5. Licenses can be added in the licensing section and selecting activate license.
6. You can still have a trial timer for modules that are not licensed by an active license
7. modules still in trial mode can be viewed by selecting the 'view modules' button in the trial banner

##### <u>Activating Licenses</u>

**Online Activation**
- requires internet connection
1. Go to licensing page under system
2. type in license key
3. once the key has been confirmed, select activate
4. if new modules are added, click refresh

**Offline Activation**
1. Go to licensing page under system
2. select activate license, and type in the key
3. when no internet connection is detected, you have the option to activate offline
4. click download activation request
5. send the downloaded file to a computer with internet access
6. go to the provided link
7. upload the text file
8. click upload activation file
9. take this file back to the gateway server
10. upload the license file and click activate
11. reloading the license requires you to deactivate the license, and perform steps 1-10 again


## Ignition Redundancy 
<hr>

##### <u>Ignition Redundancy</u>
- Ignition support a two node system
- One designated as master, the other as backup
- Status overview shows redundancy system
- both systems are identical, changes on master are queued to redundant node
- backup node will not allow property changes
- system will automatically fail-over to backup
- all clients will switch to backup during fail-over
- the gateways don't have to be installed on same type of system
- the gateways need to be the same ignition version

##### <u>Setting up Redundancy</u>
1. Go to configure page on master node
2. under system, select redundancy
3. change the mode property to master
4. scroll down to master node settings
	1. no changes are necessary, but these are the settings that only apply to the master node
5. Go to configure page on backup node
6. under system, select redundancy
7. change the mode property to backup
8. scroll down to backup node settings
9. set master node address 
10. port 8060 is the correct port
	1. when synchronisation occurs, the backup gateway will be overridden, ensure any required data is backed up
11. To approve the connection, swap back to the master gateway
12. Go to configure/network settings
13. go to incoming connections
14. approve the incoming connection from the backup node
15. You can verify that a gateway is a backup by going to the status page on either the backup or master node

##### <u>Redundant Licensing</u>
- you will need a license on both the master and the backup. If the backup doesn't have a license when a fail-over occurs, the modules won't work
- You have the option when purchasing a license for a backup license
- the backup license will ensure that the mode will be permanently set to backup for the gateway

## Gateway Network
<hr>

##### <u>Overview</u>
- The gateway network allows two gateways to connect and share data
- unlocks the ability to use Ignition distribution services
- currently 4 major systems
- Remote Tags:
	- stored and activate on one gateway
- Remote History Providers
	- store and query history data from any gateway
- Remote alarms
	- setup and use alarms on any gateway
- Enterprise Administration
	- control and maintain multiple gateways from a central gateway

##### <u>Setting up a Gateway Connection</u>
1. Requires two ignition gateways on same network
2. Navigate to config/networking/gateway network
3. go to outgoing connection tab
4. create new outgoing gateway connection
5. go to remote gateways incoming connections
6. approve the incoming connection's certificate and connection

##### <u>Remote Tag provider</u>

requirements:
	1. two separate gateways
	2. both gateways connected via gateway network

1. navigate to config>tags>real-time tag providers
2. select create new tag provider
3. select remote tag provider
4. select the desired gateway network
5. select the desired tag providers on the remote gateway
6.  