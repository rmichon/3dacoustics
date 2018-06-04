// resonator.scad
// Romain Michon, CCRMA - Stanford University
// Simple generic string instrument resonator OpenScad model.

// Parameters
width = 150;
height = 40;
shape = 0.5; // 0.00001 (square) to 1 (circular)
wall_thickness = 2;
hole_diameter = 40;

module roundedCube(dimension=[10,10,10],edgeRadius=1){
    hull(){
    translate([-dimension[0]/2+edgeRadius,-dimension[1]/2+edgeRadius,0]) cylinder(h=dimension[2],r=edgeRadius);
    translate([dimension[0]/2-edgeRadius,-dimension[1]/2+edgeRadius,0]) cylinder(h=dimension[2],r=edgeRadius);
    translate([-dimension[0]/2+edgeRadius,dimension[1]/2-edgeRadius,0]) cylinder(h=dimension[2],r=edgeRadius);
    translate([dimension[0]/2-edgeRadius,dimension[1]/2-edgeRadius,0]) cylinder(h=dimension[2],r=edgeRadius);
    }
}

module resonator() { 
    radius = shape*width/2;
    xscaler = 1 - wall_thickness*2/width;
    yscaler = 1 - wall_thickness*2/height;
    module baseShape() {
        roundedCube([width,width,height],radius);
    }
    difference() {
        baseShape();
        translate([0,0,wall_thickness]) scale([xscaler,xscaler,yscaler]) baseShape();
        translate([0,0,wall_thickness]) cylinder(h=height,d=hole_diameter);
    }
}

// RENDERING
resonator();
$fn=500;