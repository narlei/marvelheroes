//
//	RootClass.swift
//
//	Create by Narlei Moreira on 3/9/2018
//	Copyright © 2018 SocialBase. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Comic : BaseWork{

	var characters : PersonWork?
	var collectedIssues : [AnyObject]?
	var collections : [AnyObject]?
	var creators : Character?
	var dates : [Date]?
	var descriptionField : String?
	var diamondCode : String?
	var digitalId : Int?
	var ean : String?
	var format : String?
	var id : Int?
	var images : [Thumbnail]?
	var isbn : String?
	var issn : String?
	var issueNumber : Int?
	var modified : String?
	var pageCount : Int?
	var upc : String?
	var urls : [Link]?
	var variantDescription : String?
	var variants : [AnyObject]?


	override func mapping(map: Map) {
        super.mapping(map: map)
        characters         <- map["characters"]
        collectedIssues    <- map["collectedIssues"]
        collections        <- map["collections"]
        creators           <- map["creators.items"]
        dates              <- map["dates"]
        descriptionField   <- map["description"]
        diamondCode        <- map["diamondCode"]
        digitalId          <- map["digitalId"]
        ean                <- map["ean"]
        format             <- map["format"]
        id                 <- map["id"]
        images             <- map["images"]
        isbn               <- map["isbn"]
        issn               <- map["issn"]
        issueNumber        <- map["issueNumber"]
        modified           <- map["modified"]
        pageCount          <- map["pageCount"]
        upc                <- map["upc"]
        urls               <- map["urls"]
		variantDescription <- map["variantDescription"]
        variants           <- map["variants"]
		
	}
}
