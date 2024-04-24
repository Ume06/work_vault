## Functions of edge-watchdog

1. Listen for heartbeat from Edge
	1. if no heartbeat for 1min toggle power output off for 10s
	2. until heartbeat is restored, toggle power output off for 10s every hour
	3. response to heartbeat with time since last 5 failures and uptime
2. Allow use of serial to set
	1. time without heartbeat before restart
	2. time between restarts and no power restore
	3. arm heartbeat detector
3. Ethernet LED's
	1. orange will trun on for sending data
	2. green will turn on for receiving data
4. onboard LED's
	1. Power is supplied to PCB
	2. Power is supplied to V<sub>load </sub>
	3. Hearbeat signal has been received in the last minute

## Testing

| Test Cases                                                                                                        | Expected Result                                                                                                                           |
| ----------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| use serial to arm pico                                                                                            | pico will respond with time before restart and time between restarts                                                                      |
| use serial to send heartbeat signal                                                                               | pico responds with time since last five restarts, LED_3 will turn on for one minute from each heartbeat                                   |
| use serial to change heartbeat detection and restart parameters                                                   | pico will respond with updated time before restart and time between restarts                                                              |
| use serial to arm pico and do not send heartbeat                                                                  | pico will toggle edge power off for 10s after 1 minute, then again once every hour it does not receive a heartbeat                        |
| use serial to arm pico and do not send heartbeat until after first restart, then send heartbeat                   | pico will toggle edge power off for 10s after 1 minute, then after arming signal is received it will respond with time since last restart |
| send heartbeat to pico without arming                                                                             | pico will respond with not armed signal, edge will then arm pico                                                                          |
| cause edge brownout by using a variable power supply and decreasing voltage, then bringing voltage back up to 24v | pico will restart edge after 1 minute, edge will re-send arming signal, informing pico power is back on.                                  |
| restart pico without restarting the edge (use PoE for power)                                                      | pico will respond to next heartbeat with not armed signal, edge will send arming signal, and operation will continue normally.            |
| restart edge manually, ensure that systemctl is configured to restart edge-watchdog service                       | edge-watchdog service will reboot automatically                                                                                           |
| kill edge-watchdog service, ensure that systemctl is configured to restart edge-watchdog service                  | edge-watchdog service will reboot automatically                                                                                           |
| supply power to the pcb                                                                                           | LED_1 will turn on                                                                                                                        |
| supply power to the edge from the pcb                                                                             | LED_2 will turn on                                                                                                                        |
| send data to watchdog from edge                                                                                   | green LED on watchdog turns on when data is received                                                                                      |
| send data to edge from watchdog                                                                                   | orange LED on watchdog turns on when data is received                                                                                     |
