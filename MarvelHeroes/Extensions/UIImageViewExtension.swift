//
//  File.swift
//  MarvelHeroes
//
//  Created by Narlei A Moreira on 03/09/18.
//  Copyright © 2018 Narlei A Moreira. All rights reserved.
//

import Foundation
import SDWebImage

enum MarvelImageSize: String {
    case portrait_small = "portrait_small"
    case portrait_medium = "portrait_medium"
    case portrait_xlarge = "portrait_xlarge"
    case portrait_fantastic = "portrait_fantastic"
    case portrait_uncanny = "portrait_uncanny"
    case portrait_incredible = "portrait_incredible"
    
    case standart_small = "standart_small"
    case standart_medium = "standart_medium"
    case standart_xlarge = "standart_xlarge"
    case standart_fantastic = "standart_fantastic"
    case standart_uncanny = "standart_uncanny"
    case standart_incredible = "standart_incredible"
    
    case landscape_small = "landscape_small"
    case landscape_medium = "landscape_medium"
    case landscape_xlarge = "landscape_xlarge"
    case landscape_fantastic = "landscape_fantastic"
    case landscape_uncanny = "landscape_uncanny"
    case landscape_incredible = "landscape_incredible"
}

extension UIImageView {
    func load(thumbnail: Thumbnail?, size: MarvelImageSize, onComplete:@escaping ((UIImage)?) -> Void){
        
        var urlString = ""
        if let thumb = thumbnail {
            if let path = thumb.path, let ext = thumb.ext {
                urlString = "\(path)/\(size).\(ext)"
            }
        } else {
            urlString = "https://narlei.com/image_not_found.jpg"
        }
        self.sd_setImage(with: URL(string:urlString)) { (image, error, type, url) in
            onComplete(image)
        }
    }
}
