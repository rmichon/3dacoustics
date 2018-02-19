# Experiment 1: Membrane, Resonator, and Solid Object

The main idea behind this first experiment is to try to print and model three
completely different acoustic objects: 
* a membrane with rigid terminations (a simple tambourine), 
* an open resonator/instrument body (a box with a hole),
* a solid object (a marimba bar). 

Each of them present different modeling challenges which is why they were 
chosen. The two main goals here are to:

* verify how well the acoustic of the objects can be predicted
* compare the differences between 2 identical objects using modal analysis.
Therefore, objects should be printed twice. 

## Model Properties

### Tambourine (`tambourine/tambourine.scad`)

A circular membrane mounted on a rigid frame.

* **Shape:** circular
* **Diameter:** 150mm
* **Membrane Thickness:** 1mm
* **Frame Thickness:** 3mm

### Resonator (`resonator/resonator.scad`)

A box with a hole at the center of the top face. 

* **Shape:** square with rounded corners
* **Dimensions:** 150x150x40mm
* **Wall Thickness:** 2mm
* **Hole Shape:** circular
* **Hole Diameter:** 40mm

### Marimba Bar (`marimba/marimba.scad`)

A standard marimba tone bar.

* **Dimensions:** 220x25x11mm

## Experiment Steps

1. Print the objects (twice)
2. Measure their impulse response at different excitation positions
3. Make the physical model of the objects
4. Compare the model to the measured impulse responses
