import ceylonfx.application {
	CeylonFxAdapter
}

import javafx.scene.image {
	JImageView=ImageView
}


shared class ImageView(Image image) 
		extends CeylonFxAdapter<JImageView>() {
    
        JImageView jimageview = JImageView(image.delegate);
		
		shared actual JImageView createDelegate() => jimageview;
			
}