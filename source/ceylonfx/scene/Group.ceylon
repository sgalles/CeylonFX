import ceylonfx.application {
	CeylonFxAdapter, CeylonNode, asNodes
}

import javafx.scene {
	JGroup=Group, Node
}

shared class Group({Node|CeylonNode*} children = [])
		extends CeylonFxAdapter<JGroup>() {
	
	
	shared actual JGroup createDelegate() {
		value jgroup = JGroup(*asNodes(children));
		return jgroup;
	}
	
	
}