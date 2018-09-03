//
//  Constants.swift
//  MarvelHeroes
//
//  Created by Narlei A Moreira on 03/09/18.
//  Copyright © 2018 Narlei A Moreira. All rights reserved.
//

import Foundation

enum Constants {
    enum API {
        static let baseAddress = "https://gateway.marvel.com/v1/public"
        static let privateKey  = "YOUR_KEY"
        static let publicKey   = "YOUR_KEY"
    }
    
    static let debugMode = false
    
    enum Cell {
        static let personList = "cellList"
        static let personDetail = "cellDetail"
    }
}
