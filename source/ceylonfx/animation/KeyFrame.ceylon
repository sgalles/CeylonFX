import ceylonfx.application {
    CeylonFxAdapter
}
import ceylonfx.event {
    ActionEvent,
    EventHandler
}
import ceylonfx.util {
    Duration
}

import javafx.animation {
    JKeyFrame=KeyFrame
}
import javafx.event {
    JEventHandler=EventHandler,
    JActionEvent=ActionEvent
}

shared class KeyFrame(
	Duration time, 
	EventHandler<ActionEvent> onFinished)
		extends CeylonFxAdapter<JKeyFrame>() {
	
	
	shared actual JKeyFrame createDelegate() {
		object jeventhandler satisfies JEventHandler<JActionEvent>{
			shared actual void handle(JActionEvent jactionevent) {
				object actionevent extends ActionEvent() {
					createDelegate() => jactionevent;
				}
				onFinished(actionevent);
			}
		}
			
		value jkeyframe = JKeyFrame(time.delegate, jeventhandler);
		return jkeyframe;
	}
	
	
}