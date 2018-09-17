//
//  MarvelAPIType.swift
//  MarvelHeroes
//
//  Created by Narlei A Moreira on 03/09/18.
//  Copyright © 2018 Narlei A Moreira. All rights reserved.
//

import Moya
import ObjectMapper

protocol MarvelAPIType: TargetType {
    var usesAuth: Bool {get}
}

extension MarvelAPIType {
    
    public var baseURL: URL { return MarvelAPI.baseURL }
    
    public var method: Moya.Method { return .get }
    
    public var task: Task { return .requestPlain }
    
    public var headers: [String: String]? { return nil }
    
    public var usesAuth: Bool { return true }
    
    func stubbedResponse(fileName: String) -> Data! {
        let path = Bundle.main.path(forResource: fileName, ofType: "json")
        return try? Data(contentsOf: URL(fileURLWithPath: path!))
    }
}



extension Response {
    func mapMappable<T:Mappable>(object: T.Type) -> [T]? {
        do {
            let dicJson =  try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
            if let data = dicJson["data"] as? [String: Any],
                let results = data["results"] as? [[String: Any]] {
                var arrayMovies = [T]()
                for item in results {
                    if let person = object.init(JSON: item) {
                        arrayMovies.append(person)
                    }
                }
                return arrayMovies
            }
            return nil
        } catch {
            return nil
        }
    }
}
