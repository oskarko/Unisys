//
//  UIImageView+Ext.swift
//  Unisys
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func downloadImage(url: String) {
        guard !url.isEmpty, let documentURL = URL(string: url) else {
            self.setImage(nil)
            return
        }
        
        DispatchQueue(label: "ImageDownloadQueue").async {
            if let data = NSData(contentsOf: documentURL) {
                self.setImage(UIImage(data: data as Data))
            } else {
                print("No image to download: ", url)
                self.setImage(nil)
            }
        }
        
    }
    
}

private extension UIImageView {
    
    func setImage(_ image: UIImage?) {
        DispatchQueue.main.async {
            self.image = image
        }
    }
}
