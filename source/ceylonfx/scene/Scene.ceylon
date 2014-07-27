import ceylonfx.application {
    CeylonFxAdapter,
    CeylonNode
}
import ceylonfx.binding {
    Binding,
    ObjectProperty
}
import ceylonfx.event {
    EventHandler
}
import ceylonfx.geometry {
    Dimension
}
import ceylonfx.scene.input {
    KeyEvent
}
import ceylonfx.scene.paint {
    Paint,
    white
}
import javafx.scene.input {
    JKeyEvent=KeyEvent
    
    
}
import javafx.event { 
    JEventHandler=EventHandler
}
import javafx.scene {
    Node,
    JScene=Scene
}

shared class Scene(
    Dimension dimension = [600.0, 400.0],
    Paint|Binding<Object, Paint> fill = white,
    Boolean depthBuffer = false,
    {Node|CeylonNode*} children = [])
        extends CeylonFxAdapter<JScene>() {
    
    shared ObjectProperty<Paint> fillProperty = ObjectProperty<Paint>(white);
    
    shared Group group = Group(children);
    
    shared actual JScene createDelegate(){ 
        value jscene = JScene(group.delegate, dimension[0], dimension[1], depthBuffer);
        fillProperty.onChange((Paint paint) => jscene.fill = paint.delegate);
        switch(fill)
        case (is Paint) { fillProperty.set(fill); }
        case (is Binding<Object, Paint>) { fill.bind(fillProperty); }
        return jscene;
    }
    
    shared Cursor cursor => Cursor(delegate.cursor);
    assign cursor => delegate.cursor=cursor.cursor;
    
    // TODO : implement with CeylonFX patterns
    shared EventHandler<KeyEvent>? onKeyPressed{
        if(exists delegateOnKeyPressed = delegate.onKeyPressed){
            return void(KeyEvent keyEvent){
                delegateOnKeyPressed.handle(keyEvent.delegate);
            };
        }else{
            return null;
        }
    }
    assign onKeyPressed{
        if(exists onKeyPressed){
            object jeventhandler satisfies JEventHandler<JKeyEvent>{
                shared actual void handle(JKeyEvent t) {
                    object actionevent extends KeyEvent() {
                        createDelegate() => t;
                    }
                    onKeyPressed(actionevent);
                }	
            }
            delegate.onKeyPressed = jeventhandler;
        }else{
            delegate.onKeyPressed = null;
        }
    }
    
    shared EventHandler<KeyEvent>? onKeyReleased{
        if(exists delegateOnKeyReleased = delegate.onKeyReleased){
            return void(KeyEvent keyEvent){
                delegateOnKeyReleased.handle(keyEvent.delegate);
            };
        }else{
            return null;
        }
    }
    assign onKeyReleased{
        if(exists onKeyReleased){
            object jeventhandler satisfies JEventHandler<JKeyEvent>{
                shared actual void handle(JKeyEvent t) {
                    object actionevent extends KeyEvent() {
                        createDelegate() => t;
                    }
                    onKeyReleased(actionevent);
                }	
            }
            delegate.onKeyReleased = jeventhandler;
        }else{
            delegate.onKeyReleased = null;
        }
    }
    
    
}
