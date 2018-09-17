//
//  PersonWorkItemTests.swift
//  MarvelHeroesTests
//
//  Created by Narlei A Moreira on 05/09/18.
//  Copyright © 2018 Narlei A Moreira. All rights reserved.
//

import XCTest
@testable import MarvelHeroes

class PersonWorkItemTests: XCTestCase {
    
    let defaultId = 123
    
    func testGetId() {
        let json = ["title": "Narlei", "resourceURI": "http:narlei.com/tests/\(defaultId)"]
        if let workItem = PersonWorkItem(JSON: json) {
            if let id = workItem.getId() {
                XCTAssert(id == defaultId, "Id retrieved is wrong")
            }else{
                XCTFail("Error getting ID")
            }
        } else{
            XCTFail("Error parsing PersonWorkItem")
        }
    }
    
    func testGetFailedId() {
        let json = ["title": "Narlei", "resourceURI": "http:narlei.com/tests/XYZ"]
        if let workItem = PersonWorkItem(JSON: json) {
            XCTAssert(workItem.getId() == nil, "Error id need to be nil")
        } else{
            XCTFail("Error parsing PersonWorkItem")
        }
    }
    
}
