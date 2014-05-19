
import ceylonfx.application {
	CeylonFxAdapter
}
import javafx.util {
	JDuration=Duration
}

shared class Duration(Float millis)
	extends CeylonFxAdapter<JDuration>(){
	
	shared actual JDuration createDelegate(){
		value jduration = JDuration(millis);
		return jduration;
	}
	
	
}