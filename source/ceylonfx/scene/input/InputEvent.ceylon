import javafx.scene.input {
	JInputEvent=InputEvent
}
import ceylonfx.application { CeylonFxAdapter }

shared abstract class InputEvent() extends CeylonFxAdapter<JInputEvent>(){}