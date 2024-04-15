#Troubleshooting

# Contents  
1. [[#Purpose]]  
2. [[#How to log into the FH CMMS Azure server]]  
3.  [[#Finding SAGE Edge IP Address]]  
4. [[#How to log into a FH Edge]]  
5. [[#Diagnosing and Solving Problems]]  
  1. [[#Server]]  
    1. [[#Ignition Gateway Offline]]  
    2. [[#Azure Server Offline]]  
  2. [[#Edge]]  
    1. [[#Fire Cameras Offline - PM2 Variation]]  
    2. [[#Gateway Offline Fault, Edge Online]]  
    3. [[#Site-Wide faults with Edge accessible]]  
6. [[#Who to reach out to if there is an issue]]

---  
# Purpose

This troubleshooting guide is designed to assist personnel in resolving common issues related to the CMMS, Azure server, and SAGE Edge devices deployed for FH projects. It provides step-by-step instructions for tasks such as logging into servers, finding device IP addresses, diagnosing server and Edge problems, and contacting relevant personnel for assistance. By following this guide, users can efficiently troubleshoot and resolve issues, ensuring smooth operation of the CMMS and Edge devices within FH projects.

---  
# How to log into the FH CMMS Azure server  

1. Using a terminal program, SSH into:  
```  
SSH fulton.edge.sageautomation.com  
```  
Username and password:  
sageadmin:XXX

---  
# Finding SAGE Edge IP Address  
1. Log into the FH CMMS  
2. Using the 'Devices' module locate the desired device.  
3. Using the 'Status' tab, navigate to the 'Network' status.  
4. The cellular IP address will be visible in the 'Cellular' section of the view.

---   
# How to log into a FH Edge

>[!info]   
>SAGE is currently working toward implementing [Tailscale](https://tailscale.com)into all Edge devices, making this process easier, and universally applicable.

>[!warning]   
>This process is not applicable to New Zealand SAGE Edge devices.   
>  
>For New Zealand Edges please see [[#How to log into a NZ FH Edge]].

SAGE Edge devices deployed for FH in Australia are using publicly-accessibly SIM cards and can be connected to using the IP address and password.  
1. Find the desired IP address of the Edge device using the CMMS  
2. Using LastPass, find the password for the chosen Edge device.  
3. Using a terminal program, ssh into the device using:  
```  
ssh pi@IP_ADDRESS  
```  
4. When prompted, input the password.  
5. The device will grant access.

## How to log into a NZ FH Edge

---  
# Diagnosing and Solving Problems  
- [[#Server]]  
- [[#Edge]]  
## Server  
### Ignition Gateway Offline

**Problem:** The Ignition Gateway is offline  
**Solution:** Restart Ignition Gateway service

1. Follow [[#How to log into the FH CMMS host server]]  
2. Run `pstree` to confirm running processes  
3. Run `systemctl status Ignition-Gateway.service` to see Ignition status  
4. Run `systemctl restart Ignition-Gateway.service` to restart Ignition Gateway service.

### Azure Server Offline  
???

## Edge  
To diagnose problems on the SAGE Edge, the correct processes must be known, they are:  
- pm2  
- 70897-asphalt-connector  
- 70897-hanwha-connector  
- edge-asphalt-monitor  
- edge-gastech-connector  
- edge-battery connector  
- asphalt-monitor  
- mosquitto

### Fire Cameras Offline - PM2 Variation  
**Problem:** Gastech cameras are reporting offline on CMMS  
**Solution:** Restart Gastech camera processes

>[!note] Different Edges will have different processes running to manage Gastech camera live feeds. Identifying the process on the current Edge will help inform how to solve the problem.

>[!warning] All pm2 commands must be run as root

1. Run `pm2 list`  
2. If there is a pm2 camera process, and it is stopped, proceed through the steps, otherwise investigate other processes.  
3. Run `pm2 restart PID` with PID being the process ID given by the `pm2 list` command.  
4. Verify camera operation on the CMMS.

### Gateway Offline Fault, Edge Online  
>[!note]  
>There are two variations of the asphalt-monitor service: edge-asphalt-monitor and asphalt-monitor. Follow the corresponding steps below based on the specific variation you encounter.

**Problem:** FH CMMS is showing that the gateway is offline, but the Edge can be accessed  
**Solution:** Restart edge-asphalt-monitor  
1. Follow [[#How to log into a FH Edge]]  
2. Run `systemctl status edge-asphalt-monitor` and verify status  
3. Run `systemctl restart edge-asphalt-monitor`  
4. Verify gateway health on the CMMS

**Solution:** Restart asphalt-monitor  
1. Follow [[#How to log into a FH Edge]]  
2. Run `systemctl status asphalt-monitor` and verify status  
3. Run `systemctl restart asphalt-monitor`  
4. Verify gateway health on the CMMS

### Site-Wide faults with Edge accessible  
**Problem:** There are site-wide faults on the CMMS with the Edge still online  
**Solution:** Restart Mosquitto service  
1. Follow [[#How to log into a FH Edge]]  
2. Run `systemctl status mosquitto.serivice` and verify status  
3. Run `systemctl restart mosquitto-service`  
4. Verify system health on the CMMS

---  
# What resources to check if there is a problem with the SAGE Edge  
# Who to reach out to if there is an issue  
1. Duncan Spencer  
  1. duncan.spencer@sageautomation.com  
2. Marius Scutea  
  1. marius.scutea@sageautomation.com  
3. Alan Ford  
  1. alan.ford@sageautomation.com

**Step 1:** Check PSTree for a visualisation of all running processes.

Command: pstree

**Step 2:** Check and make sure there is something connected to USB0

**Step 3:** will check status of service.

Command: systemctl status asphalt-monitor

**Step 4:** Checking the status of the service will uncover what must be done next.

Try to restart the service

Command: systemctl restart asphalt-monitor

**Step 5:** If the restart doesn’t fix the issue, restart pm2

Status → Administration → Scripting

pm2 restart 1

as root