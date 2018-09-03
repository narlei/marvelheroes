//
//	Thumbnail.swift
//
//	Create by Narlei Moreira on 3/9/2018
//	Copyright © 2018 SocialBase. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Thumbnail : NSObject, Mappable{

	var ext : String?
	var path : String?

	required init?(map: Map){}

	func mapping(map: Map) {
        ext  <- map["extension"]
		path <- map["path"]
	}
}
