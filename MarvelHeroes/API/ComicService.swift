//
//  ComicService.swift
//  MarvelHeroes
//
//  Created by Narlei A Moreira on 03/09/18.
//  Copyright © 2018 Narlei A Moreira. All rights reserved.
//

import Moya

public enum ComicService {
    case detail(id: Int)
}

extension ComicService: MarvelAPIType {
    
    public var path: String {
        switch self {
        case .detail(let id):
            return "comics/\(id)"
        }
    }
    
    public var sampleData: Data {
        return stubbedResponse(fileName: "Comic")
    }
    
}


