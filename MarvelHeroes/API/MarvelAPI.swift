//
//  MarvelAPI.swift
//  MarvelHeroes
//
//  Created by Narlei A Moreira on 03/09/18.
//  Copyright © 2018 Narlei A Moreira. All rights reserved.
//

import Moya

public final class MarvelAPI {
    
    var baseURL:String
    var privateKey: String
    var publicKey: String
    
    init(baseURL: String, privateKey: String, publicKey: String) {
        self.baseURL = baseURL
        self.privateKey = privateKey
        self.publicKey = publicKey
    }
    
    static let baseURL = URL(string: Constants.API.baseAddress)!
    
    
    public var characters: MoyaProvider<CharacterService> {
        return createProvider(for: CharacterService.self)
    }
    
    public var comics: MoyaProvider<ComicService> {
        return createProvider(for: ComicService.self)
    }
    
    public var events: MoyaProvider<EventService> {
        return createProvider(for: EventService.self)
    }
    
    public var series: MoyaProvider<SerieService> {
        return createProvider(for: SerieService.self)
    }
    
    public var stories: MoyaProvider<StoryService> {
        return createProvider(for: StoryService.self)
    }
    
    private func createProvider<T: MarvelAPIType>(for target: T.Type) -> MoyaProvider<T> {
        let endpointClosure = createEndpointClosure(for: target)
        
        var plugins = [PluginType]()
        if Constants.debugMode {
            plugins.append(NetworkLoggerPlugin())
        }
        
        plugins.append(MarvelAPIAuthPlugin(autenticateParameters: MarvelAPI.authenticationParameters(privateKey: self.privateKey, publicKey: self.publicKey)))
        
        return MoyaProvider<T>(endpointClosure: endpointClosure, plugins: plugins)
    }
    
    private func createEndpointClosure<T: TargetType>(for target: T.Type) -> MoyaProvider<T>.EndpointClosure {
        let endpointClosure = { (target: T) -> Endpoint in
            let endpoint = MoyaProvider.defaultEndpointMapping(for: target)
            return endpoint
        }
        
        return endpointClosure
    }
    
    class func authenticationParameters(privateKey: String, publicKey: String, timestamp:String = String(Date().timeIntervalSince1970)) -> [String:String] {
        
        let hash = self.requestHash(timestamp: timestamp, apiPrivateKey: privateKey, apiPublicKey: publicKey)
        let autenticateParameters = ["ts": timestamp, "apikey": publicKey, "hash": hash]
        
        return autenticateParameters
    }
    
    class func requestHash(timestamp: String, apiPrivateKey: String, apiPublicKey: String) -> String {
        let string = timestamp + apiPrivateKey + apiPublicKey
        let hash = string.getMD5()
        return hash.map { String(format: "%02hhx", $0) }.joined()
    }
    
}
