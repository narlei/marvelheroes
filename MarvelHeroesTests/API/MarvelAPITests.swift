//
//  MarvelAPITests.swift
//  MarvelHeroesTests
//
//  Created by Narlei A Moreira on 05/09/18.
//  Copyright © 2018 Narlei A Moreira. All rights reserved.
//

import XCTest
@testable import MarvelHeroes

class MarvelAPITests: XCTestCase {
    
    let baseURL = "https://gateway.marvel.com/v1/public"
    let privateKey = "123"
    let publicKey = "456"
    var api:MarvelAPI!

    override func setUp() {
        super.setUp()
        self.api = MarvelAPI(baseURL: self.baseURL, privateKey: self.privateKey, publicKey: self.publicKey)
    }
    
    func testAuthenticationParameters() {
        let hashApi = MarvelAPI.requestHash(timestamp: "NOW", apiPrivateKey: self.privateKey, apiPublicKey: self.publicKey)
        let parameters = MarvelAPI.authenticationParameters(privateKey: self.privateKey, publicKey: self.publicKey, timestamp: "NOW")
        if let apikey = parameters["apikey"] {
            XCTAssert(apikey == self.publicKey, "apiKey isn't publicKey")
        }else{
            XCTFail("Error with parameter `apikey`")
        }
        
        if let hash = parameters["hash"] {
            XCTAssert(hash == hashApi, "hash generated is wrong")
        }else{
            XCTFail("Error with parameter `hash`")
        }
    }
    
    func testProviderSetup(){
        XCTAssert(self.api.comics.plugins.count > 0, "Comics provider setup fail")
        XCTAssert(self.api.events.plugins.count > 0, "Events provider setup fail")
        XCTAssert(self.api.stories.plugins.count > 0, "Stories provider setup fail")
        XCTAssert(self.api.series.plugins.count > 0, "Series provider setup fail")
    }

}
