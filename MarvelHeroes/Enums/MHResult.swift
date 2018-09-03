//
//  MHResult.swift
//  MarvelHeroes
//
//  Created by Narlei A Moreira on 05/09/18.
//  Copyright © 2018 Narlei A Moreira. All rights reserved.
//

import Foundation

public enum MHResult<T>: Error {
    case success(object:T)
    case failure(message:String)
}

