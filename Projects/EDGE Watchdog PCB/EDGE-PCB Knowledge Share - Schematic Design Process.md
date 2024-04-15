#### Begin Design
---
1. Begin by going over scope and requirements for hardware and software
2. Draw a black box diagram with a high level overview of functionalities
3. Ensure that each black box is modular (i.e., not dependent on other parts)
4. Check that each requirement and function from the scope has been met by the diagram

#### Picking Parts
---
1. Before designing the schematic, it is useful to start attributing specific parts or modules to your black boxes.
2. Parts can be changed later, so it is not essential to get them right the first time.
3. Start searching for parts that match the criteria you've assigned in the black boxes 
4. Check that your supplier has the parts and they are in stock
5. A few things to take into consideration from the datasheet for the parts you are using:
	1. is the operating voltage correct?
	2. is it the correct mounting type?
	3. is the operating temperature range large enough?
	4. What is the output voltage?
	5. What is the maximum power input?

> [!tip]
> Parts can be defined in the scope / requirements doc, but it is important to check that they will meet specifications

#### Creating the Schematic
---
1. free tool that I use is KiCAD, as it integrates the schematic with PCB layout.
2. Create a new KiCAD project, and open the schematic editor.
3. Start plotting your chosen parts as symbols
4. KiCAD has a large variety of pre-installed symbols, however it doesn't have everything. 
	- You can choose to create your own, but I find that downloading them online is easier, simply googling the part you want and 'footprint' will return some good resources
	- If you can't find it there are plenty of good tutorials on making it yourself, as it is an easy process
5. Once you have laid down a few symbols, you can wire them together. KiCAD has a few really good tools to help this process
	1. **Direct Wires**: can be used to clicking on the end of a pin or pressing 'w'. Terminate by clicking on another pin, or double clicking
	2. **Power Ports**: Used to represent power and ground in the schematic, helpful to avoid clutter. can be made by pressing 'p' or clicking the ground logo on the right bar, then selecting the voltage in use. Can be attached to multiple pins
	3. **Labels**: Labels are similar to power ports, but just represent a connection between two points, can be attached to multiple pins
6. When joining components, ensure that everything is connected to the correct pins, as KiCAD will not tell you if you make a wiring mistake. The Review is a crucial process to go over before beginning the PCB layout as it will save time and mistakes. 
7. Ensure you also go over selected parts. Really helpful giving the datasheet a thorough read to make sure wires are connected to the correct pins, and the right voltage is used.
8. Once all parts are connected,  use the no-connection flag on all unused pins by pressing 'x' and hovering the pins. This will make PCB design easier, as it will alert you when the pins are connected. 
9. The last step before beginning PCB design is to ensure that all symbols have an associated footprint. If you are using a pre-made symbol, you will most likely find a default footprint for the part. It is vital to ensure that each component has a footprint that matches the specifications exactly, and can be done by making them based off of the datasheet following a tutorial. Parts without footprints will not appear in the PCB editor.

#### PCB Design
---
1. Opening the PCB editor and importuning all the parts will present you with what is called the 'rat's nest', a mess of components and connections.
2. Each line represents a necessary connection between elements. I recommend first moving the components around in such a way that it untangles the lines as much as possible before you beginning laying down wires. 

> [!tip]
> Turning off the GND net will make it easier to start the process

3. Wiring components is an experience and trial and error process. In this case I am trying to build a single sided PCB, so one of the connections can overlap. A few strategies I have use to aid my design:
	   1. Using the space between a resistors contacts on a board as a bridge, so that wires can crossover without touching
	   2. going between the pins on larger components
4. Once all components are connected minus the GND, you can create a ground layer. This will connect to all GND pins on the board. Make sure that there is room in your wires for the plane to all connect together.
5. After all wires have been drawn, use the drawing tool to draw an edge cuts, this is the physical dimensions of the board that will be printed on. 
6. Finally, review the board yet again, from the schematics. Check things such as port orientation and connection consistency with parts.

> [!tip]
> Adding some text or logos via the silkscreen can be a nice final touch to give the board some polish


#### Handover to Manufacturer
---
1. After the PCB has been finished, it is time to export to a file the manufacturers can use to print.
2. PCBWay needs three things to print the board:
	1. Gerber files
	2. Positioning files
	3. Drill files
3. All 3 of these can be exported easily and quickly through file > fabrication output. 




#### 