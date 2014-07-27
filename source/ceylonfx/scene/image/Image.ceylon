import ceylonfx.scene {
    Node
}

import javafx.scene.image {
    JImageView=ImageView
}


shared class ImageView(Image image) 
		extends Node<JImageView>() {
    
        JImageView jimageview = JImageView(image.delegate);
		
		shared actual JImageView createDelegate() => jimageview;
			
}