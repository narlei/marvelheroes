//
//  EventServiceTests.swift
//  MarvelHeroesTests
//
//  Created by Narlei A Moreira on 03/09/18.
//  Copyright © 2018 Narlei A Moreira. All rights reserved.
//

import XCTest
import Moya
@testable import MarvelHeroes


class EventServiceTests: XCTestCase {
    
    let provider = MoyaProvider<EventService>(stubClosure: MoyaProvider.immediatelyStub)
    
    func testList() {
        provider.request(.detail(id: 0)) { (response) in
            switch response {
            case .success(let result):
                if let arrayPerson = result.mapMappable(object: Event.self) {
                    XCTAssert(arrayPerson.count > 0, "Error retrieving Data")
                }else{
                    XCTFail("Error parsing Data")
                }
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
    }
    
    func testListError() {
        let result =  Response(statusCode: 0, data: Data())
        let arrayPerson = result.mapMappable(object: Event.self)
        XCTAssert(arrayPerson == nil, "Error, array must be empty")
    }
    
}
