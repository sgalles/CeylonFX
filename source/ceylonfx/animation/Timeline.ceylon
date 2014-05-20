import ceylonfx.application {
	CeylonFxAdapter,
	transformCeylonFxAdapter
}

import javafx.animation {
	JTimeline=Timeline,
	JAnimation=Animation
}



shared class Timeline(
	{KeyFrame*} keyFrames,
	Integer cycleCount=1) 
		extends CeylonFxAdapter<JTimeline>() {
			JTimeline jtimeline = JTimeline(*transformCeylonFxAdapter(keyFrames));
			jtimeline.cycleCount = cycleCount;
			shared actual JTimeline createDelegate() => jtimeline;
			
		}