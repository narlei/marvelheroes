//
//  CharacterService.swift
//  MarvelHeroes
//
//  Created by Narlei A Moreira on 03/09/18.
//  Copyright © 2018 Narlei A Moreira. All rights reserved.
//

import Moya

public enum CharacterService {
    case list(limit: Int, offset: Int, query: String)
}

extension CharacterService: MarvelAPIType {
    
    public var path: String {
        switch self {
        case .list(_ , _, _):
            return "characters"
        }
    }
    
    public var task: Task {
        switch self {
        case .list(let limit,let offset,let query):
            if !query.isEmpty {
                return .requestParameters(parameters: ["limit": limit, "offset": offset, "nameStartsWith": query], encoding: URLEncoding.default)
            }
            return .requestParameters(parameters: ["limit": limit, "offset": offset], encoding: URLEncoding.default)
        }
    }
    
    public var sampleData: Data {
        return stubbedResponse(fileName: "Person")
    }
    
}
