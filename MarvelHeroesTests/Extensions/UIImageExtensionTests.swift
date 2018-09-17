//
//  UIImageExtensionTests.swift
//  MarvelHeroesTests
//
//  Created by Narlei A Moreira on 05/09/18.
//  Copyright © 2018 Narlei A Moreira. All rights reserved.
//

import XCTest
@testable import MarvelHeroes
class UIImageExtensionTests: XCTestCase {

    func testResize() {
        if let image = UIImage(named: "test.jpg") {
            let resized = image.resizeImage(newWidth: 10)
            XCTAssert(resized.size.width == 10, "Error resizing image")
        } else {
            XCTFail("Asset not in Tests target")
        }
        
        
    }

}
