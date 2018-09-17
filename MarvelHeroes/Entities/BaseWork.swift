//
//  BaseWork.swift
//  MarvelHeroes
//
//  Created by Narlei A Moreira on 05/09/18.
//  Copyright © 2018 Narlei A Moreira. All rights reserved.
//

import Foundation
import ObjectMapper


class BaseWork : NSObject, Mappable{
    
    var resourceURI : String?
    var title : String?
    var thumbnail : Thumbnail?
    
    required init?(map: Map){}
    
    func mapping(map: Map) {
        resourceURI <- map["resourceURI"]
        title  <- map["title"]
        thumbnail  <- map["thumbnail"]
    }
}
