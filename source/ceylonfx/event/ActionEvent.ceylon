import javafx.event {
	JActionEvent=ActionEvent
}
import ceylonfx.application { CeylonFxAdapter }

shared abstract class ActionEvent() extends CeylonFxAdapter<JActionEvent>(){}