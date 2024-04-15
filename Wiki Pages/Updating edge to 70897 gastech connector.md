1. run `sudo nano /etc/apt/sources.list`  and check that first line is `deb http://archive.edge.sageautomation.com/edge-raspbian/ buster main testing bleeding` if first line is not above, replace
2. run `sudo apt update`

3. run `sudo apt install edge-mosquitto=0.9.2` , leave all options as default
4.  run `sudo mv /etc/mosquitto/conf.d/asphalt.conf asphalt.conf.bak`
5.  run `sudo nano /etc/mosquitto/conf.d/default.conf` then:
	1. replace username and password with: cmmsuser:9Xk2C5Cfk9CMhA7W
	2. replace address with `fulton.edge.sageautomation.com:1883`
	3. append `topic FultonHogan/Asphalt/${siteName}/# both 0`
7. run following commands:
```bash
sudo systemctl restart edge-mosquitto.service
sudo apt install 70897-gastech-connector  
sudo journalctl -u 70897-gastech-connector.service -f  
sudo systemctl stop edge-gastech-livefeeds.service 
sudo systemctl disable edge-gastech-livefeeds.service  
sudo systemctl stop edge-gastech-recordings.service 
sudo systemctl disable edge-gastech-recordings.service
```




### troubleshooting
- check acl file and mosquitto conf file to ensure that contents is correct

- check for asphalt-monitor by running the command `apt list | grep asphalt`, uninstall gastech-connector and asphalt-monitor if they are not the 70897 version\

# Hazelmere 3 done