//
//  ComicServiceTests.swift
//  MarvelHeroesTests
//
//  Created by Narlei A Moreira on 03/09/18.
//  Copyright © 2018 Narlei A Moreira. All rights reserved.
//

import XCTest
import Moya
@testable import MarvelHeroes


class ComicServiceTests: XCTestCase {
    
    let provider = MoyaProvider<ComicService>(stubClosure: MoyaProvider.immediatelyStub)
    
    func testList() {
        provider.request(.detail(id: 0)) { (response) in
            switch response {
            case .success(let result):
                if let arrayPerson = result.mapMappable(object: Comic.self) {
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
        let arrayPerson = result.mapMappable(object: Comic.self)
        XCTAssert(arrayPerson == nil, "Error, array must be empty")
    }
    
}
