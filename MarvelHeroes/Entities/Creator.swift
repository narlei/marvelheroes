//
//	Item.swift
//
//	Create by Narlei Moreira on 3/9/2018
//	Copyright © 2018 SocialBase. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Creator : NSObject, Mappable{

	var name : String?
	var resourceURI : String?
	var role : String?

	required init?(map: Map){}

	func mapping(map: Map) {
        name        <- map["name"]
		resourceURI <- map["resourceURI"]
        role        <- map["role"]
	}
}
