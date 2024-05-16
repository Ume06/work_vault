* Find way to make PCB same width as EDGE, will look less clunky
	* ditch LED's
	* move RJ45 port closer to pico
* potentially make PCB double sided. Gives more flexibility in adding modules
* use less power on LED's by increasing resistance - testing needed.
* work on thermal disspiation issue (could be hoardwrae related or software)
* look into why linear rectifier works, and others don't. 
* fix footrpint / part # for linear rectifier
* check static compoilation of QT file
* build debs using CI pipeline
* add test points to pcb

# pcb-schematic-v2

  

## Description

  

v2 of the edge watchdog pcb. Functionality will be identical to previous version - monitoring the edge for a heartbeat, and power cycling when no heartbeat has been received for a set interval.

  

## Usage

  

This repository holds the schematic files for the pcb designed to connect to the edge. To use, open the .pro file in [KiCad](https://www.kicad.org/) and export gerber files to print.

  

## Roadmap

  

- [ ] 