//
//  StringExtensionTests.swift
//  MarvelHeroesTests
//
//  Created by Narlei A Moreira on 03/09/18.
//  Copyright © 2018 Narlei A Moreira. All rights reserved.
//

import XCTest
@testable import MarvelHeroes
class StringExtensionTests: XCTestCase {

    func testMD5() {
        let string = "Tests"
        let md5 = string.getMD5().map { String(format: "%02hhx", $0) }.joined()

        XCTAssert(md5 == "90792de52961c34118f976ebe4af3a75", "MD5 fails")
    }

}
