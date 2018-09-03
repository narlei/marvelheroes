//
//	Comic.swift
//
//	Create by Narlei Moreira on 3/9/2018
//	Copyright © 2018 SocialBase. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class PersonWork : NSObject, Mappable{

	var available : Int?
	var collectionURI : String?
	var items : [PersonWorkItem]?
	var returned : Int?

	required init?(map: Map){}

	func mapping(map: Map) {
        available     <- map["available"]
		collectionURI <- map["collectionURI"]
        items         <- map["items"]
        returned      <- map["returned"]
	}
}
