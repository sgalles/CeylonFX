import ceylonfx.application {
	CeylonFxAdapter
}

import javafx.scene.image {
	JImage=Image
}


shared class Image(String url) 
		extends CeylonFxAdapter<JImage>() {
    
        JImage jimage = JImage(url);
		
		shared actual JImage createDelegate() => jimage;
			
}