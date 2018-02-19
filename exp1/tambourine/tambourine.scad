// tambourine.scad
// Romain Michon, CCRMA - Stanford University
// Simple generic tambourine OpenScad model.

// Parameters
width = 150;
shape = 1; // 0.00001 (square) to 1 (circular)
membrane_thickness = 1;
frame_height = 30;
frame_thickness = 3;

module roundedCube(dimension=[10,10,10],edgeRadius=1){
    hull(){
    translate([-dimension[0]/2+edgeRadius,-dimension[1]/2+edgeRadius,0]) cylinder(h=dimension[2],r=edgeRadius);
    translate([dimension[0]/2-edgeRadius,-dimension[1]/2+edgeRadius,0]) cylinder(h=dimension[2],r=edgeRadius);
    translate([-dimension[0]/2+edgeRadius,dimension[1]/2-edgeRadius,0]) cylinder(h=dimension[2],r=edgeRadius);
    translate([dimension[0]/2-edgeRadius,dimension[1]/2-edgeRadius,0]) cylinder(h=dimension[2],r=edgeRadius);
    }
}

module tambourine() { 
    radius = shape*width/2;
    scaler = 1 - frame_thickness*2/width;
    module baseShape() {
        roundedCube([width,width,frame_height+membrane_thickness],radius);
    }
    difference() {
        baseShape();
        translate([0,0,membrane_thickness]) scale([scaler,scaler,1]) baseShape();
    }
}

// RENDERING
tambourine();
$fn=500;