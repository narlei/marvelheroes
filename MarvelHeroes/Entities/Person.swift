//
//	Character.swift
//
//	Create by Narlei Moreira on 3/9/2018
//	Copyright © 2018 SocialBase. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Person : NSObject, Mappable{
    
    var descriptionField : String?
    var id : Int?
    var modified : String?
    var name : String?
    var resourceURI : String?
    var thumbnail : Thumbnail?
    var urls : [Link]?
    var comics : PersonWork?
    var events : PersonWork?
    var series : PersonWork?
    var stories : PersonWork?
    
    required init?(map: Map){}
    
    func mapping(map: Map) {
        comics           <- map["comics"]
        descriptionField <- map["description"]
        events           <- map["events"]
        id               <- map["id"]
        modified         <- map["modified"]
        name             <- map["name"]
        resourceURI      <- map["resourceURI"]
        series           <- map["series"]
        stories          <- map["stories"]
        thumbnail        <- map["thumbnail"]
        urls             <- map["urls"]
    }

}
