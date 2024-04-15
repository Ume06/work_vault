1. Open the Mosquitto configuration file for Fulton Hogan:

`sudo nano /etc/mosquitto/conf.d/asphalt.conf`
%% change to somewhere else %%

2. Update the sources list:

`sudo nano /etc/apt/sources.list`

- Ensure the first line is:

`deb [http://archive.edge.sageautomation.com/edge-raspbian/](http://archive.edge.sageautomation.com/edge-raspbian/ "http://archive.edge.sageautomation.com/edge-raspbian/") buster main testing bleeding`

3. Install edge-mosquitto version 0.9.2:

`sudo apt install edge-mosquitto=0.9.2`

4. Install the gastech connector:a

`sudo apt install 70897-gastech-connector`

5. Deal with configuration file conflicts:

```  
configuration file '/etc/mosquitto/acl'  
==> File on system created by you or by a script.  
==> File also in package provided by package maintainer.  
What would you like to do about it ? Your options are:  
```

==Choose to keep the file already on the system.==

6. Modify the Mosquitto configuration:

`sudo mv /etc/mosquitto/conf.d/asphalt.conf asphalt.conf.bak`

`sudo nano /etc/mosquitto/conf.d/default.conf`

7. Update default.conf with the contents from asphalt.conf.bak, it will look something like:  
```  
allow_anonymous true  
acl_file /etc/mosquitto/acl  
listener 1883 localhost  
connection cmms-broker  
address fulton.edge.sageautomation.com:1883  
remote_username cmmsuser  
remote_password 9Xk2C5Cfk9CMhA7W  
cleansession true  
topic v2/remote/# out 1 "" Devices/7efec82ff51e4be7b6b225d2c638cd51/  
topic v2/faults/# out 1 "" Devices/7efec82ff51e4be7b6b225d2c638cd51/  
topic v2/ig/+/desired/# in 1 "" Devices/7efec82ff51e4be7b6b225d2c638cd51/  
topic v2/ig/+/reported/# out 1 "" Devices/7efec82ff51e4be7b6b225d2c638cd51/  
topic Devices/7efec82ff51e4be7b6b225d2c638cd51/# both 1  
topic FultonHogan/Asphalt/Lyttelton/# both 0  
Restart the edge-mosquitto service:  
```

`sudo systemctl restart edge-mosquitto.service`

8. Install the gastech connector:

`sudo apt install 70897-gastech-connector`

9. Monitor gastech connector service:

`sudo journalctl -u 70897-gastech-connector.service -f`

10. Stop and disable gastech live feeds:

`sudo systemctl stop edge-gastech-livefeeds.service`  
sudo systemctl disable edge-gastech-livefeeds.service

11. Stop and disable gastech recordings:

`sudo systemctl stop edge-gastech-recordings.service`  
`sudo systemctl disable edge-gastech-recordings.service`

12. Modify the Mosquitto ACL file:

`sudo nano /etc/mosquitto/acl`

Ensure the file contains:

```  
user root  
topic #  
user edgeclient  
topic Devices/#  
user fultonhogan  
topic FultonHogan/Asphalt/#  
```

13. Restart the edge-mosquitto service:

`sudo systemctl restart edge-mosquitto.service`

This guide provides a step-by-step guide to configuring the Fulton Hogan connection on an Edge