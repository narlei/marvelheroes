//
//  MarvelAPIAuthPlugin.swift
//  MarvelHeroes
//
//  Created by Narlei A Moreira on 03/09/18.
//  Copyright © 2018 Narlei A Moreira. All rights reserved.
//

import Moya

struct MarvelAPIAuthPlugin: PluginType {
    
    let autenticateParameters: [String:String]
    
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        
        guard let marvelTarget = target as? MarvelAPIType, let urlRequest = request.urlRequest else{
            return request
        }
        
        if marvelTarget.usesAuth {
            do {
                let queryParameters = autenticateParameters
                var queryRequest = try URLEncoding(destination: .queryString).encode(urlRequest, with: queryParameters)
                queryRequest.cachePolicy = .useProtocolCachePolicy // to test whithout problems with rate limit
                return queryRequest
            } catch {
                return request
            }
        }
        return request
    }
    
}
