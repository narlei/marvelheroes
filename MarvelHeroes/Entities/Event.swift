//
//	Event.swift
//
//	Create by Narlei Moreira on 3/9/2018
//	Copyright © 2018 SocialBase. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Event : BaseWork{

	var characters : PersonWork?
	var comics : PersonWork?
	var creators : [Creator]?
	var descriptionField : String?
	var end : String?
	var id : Int?
	var modified : String?
	var next : PersonWorkItem?
	var previous : PersonWorkItem?
	var series : Character?
	var start : String?
	var stories : PersonWork?
	var urls : [Link]?


    override func mapping(map: Map) {
        super.mapping(map: map)
        characters       <- map["characters"]
        comics           <- map["comics"]
        creators         <- map["creators.items"]
		descriptionField <- map["description"]
        end              <- map["end"]
        id               <- map["id"]
        modified         <- map["modified"]
        next             <- map["next"]
        previous         <- map["previous"]
        series           <- map["series"]
        start            <- map["start"]
        stories          <- map["stories"]
        urls             <- map["urls"]
	}
}
