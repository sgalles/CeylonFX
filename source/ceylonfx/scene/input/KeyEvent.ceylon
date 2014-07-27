import javafx.scene.input {
	JKeyEvent=KeyEvent
}
import ceylonfx.application { CeylonFxAdapter }

shared abstract class KeyEvent() extends CeylonFxAdapter<JKeyEvent>(){}