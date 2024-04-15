## Deliverables
---
* Design document
* Test documentation
	* loading dock FAT
	* dry creek SAT
	* production install
* configuration + setup guide

## Risks
---
* Thermal camera interference
* thermal view of container
* scope:
	* creep
	* low margin
* remote access
* working testing in/on dock
* connection to ABPLC

## Logic
---
```mermaid
graph TD;

A(configure container area) --> B(read camera view/temps);
B --> C(pass to PLC);
B --> D(alarms);


```
```mermaid
graph LR

A(alarms) --> B(rate of change);
A --> C(leakage);
B --> D(pass to PLC);
B --> E(CMMS);
C --> D;
C --> E;
G(read fire suppresion) --> D;
G --> E;
```
