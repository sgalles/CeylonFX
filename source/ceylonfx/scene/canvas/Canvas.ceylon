
import ceylonfx.scene {
    Node
}

import javafx.scene.canvas {
    JCanvas=Canvas
}
import ceylonfx.geometry {

    Dimension
}
 

shared class Canvas(Dimension dimension = [0.0, 0.0]) 
        extends Node<JCanvas>() {
    
    JCanvas jcanvas = JCanvas(dimension[0], dimension[1]);
    
    shared actual JCanvas createDelegate() => jcanvas;
    
    shared GraphicsContext graphicsContext2D =>  GraphicsContext(jcanvas.graphicsContext2D);
    
}