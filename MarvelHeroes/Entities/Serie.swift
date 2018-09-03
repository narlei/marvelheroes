//
//	Serie.swift
//
//	Create by Narlei Moreira on 3/9/2018
//	Copyright © 2018 SocialBase. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper

class Serie : BaseWork{
    
    var characters : PersonWork?
    var comics : PersonWork?
    var creators : [Creator]?
    var descriptionField : String?
    var endYear : Int?
    var id : Int?
    var modified : String?
    var next : AnyObject?
    var rating : String?
    var startYear : Int?
    var stories : PersonWork?
    var type : String?
    var urls : [Link]?
    
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        characters       <- map["characters"]
        comics           <- map["comics"]
        creators         <- map["creators.items"]
        descriptionField <- map["description"]
        endYear          <- map["endYear"]
        id               <- map["id"]
        modified         <- map["modified"]
        next             <- map["next"]
        rating           <- map["rating"]
        startYear        <- map["startYear"]
        stories          <- map["stories"]
        type             <- map["type"]
        urls             <- map["urls"]
    }

}
