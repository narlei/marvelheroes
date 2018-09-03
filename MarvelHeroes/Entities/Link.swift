//
//	Url.swift
//
//	Create by Narlei Moreira on 3/9/2018
//	Copyright © 2018 SocialBase. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Link : NSObject, Mappable{

	var type : String?
	var url : String?

	required init?(map: Map){}
    
	func mapping(map: Map) {
		type <- map["type"]
        url  <- map["url"]
	}
}
