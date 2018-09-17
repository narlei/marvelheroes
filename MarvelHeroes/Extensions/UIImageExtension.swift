//
//  UIImageExtension.swift
//  MarvelHeroes
//
//  Created by Narlei A Moreira on 04/09/18.
//  Copyright © 2018 Narlei A Moreira. All rights reserved.
//

import UIKit

extension UIImage {
    func resizeImage(newWidth: CGFloat) -> UIImage {
        
        let scale = newWidth / self.size.width
        let newHeight = self.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth,height: newHeight))
        self.draw(in: CGRect(x: 0,y: 0,width: newWidth,height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}
