# Configuring LoRaWAN Devices for the SAGE Network
---
## The Things Network

The things Network (TTN) is avialable at [this address](https://au1.cloud.thethings.network/console), and can be accessed via LastPass. Once you have logged in, go to the applications page, and hit "+ Create appliction". 

You will be asked to fill out an Application ID, and have an optional Application Name and Description field. The ID must only contain lowercase letters and dashes ('-'), so fill that out appropriately, and then fill out a brief Name and Description for you application. Ensure that it is not too detailed, but covers the intended purpose of this application so that other Engineers are able to understand. 

Next you will be required to register End Devices to send data. Start by clicking "+ Register end device". You can either do this manually, or by finding your specific device. In Australia, devices are required to use the 915 - 928 MHz frequency band for communication, so select that as your frequency plan and the LoRaWAN Version most commonly used by SAGE is 1.0.3, although be sure to confirm these details when registering your device. The JoinEUI (or AppEUI) and DevEUI will be provided by the manufacturer of the device you are trying to connect, so it is important you find that and copy it exactly. 
> !hint 
> for larger orders, suppliers will usually provide a list of DevEUI's and JoinEUI's so you don't need to type them out manually


