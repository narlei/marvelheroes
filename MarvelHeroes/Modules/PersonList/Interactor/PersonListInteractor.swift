//
//  PersonListInteractor.swift
//  MarvelHeroes
//
//  Created by Narlei A Moreira on 04/09/18.
//  Copyright © 2018 Narlei A Moreira. All rights reserved.
//

import Foundation
import Moya

class PersonListInteractor: PersonListUseCase{
    
    var output: PersonListInteractorOutput?
    
    private var api: MarvelAPI
    private let limit = 20
    
    
    init(api:MarvelAPI = MarvelAPI(baseURL: Constants.API.baseAddress, privateKey: Constants.API.privateKey, publicKey: Constants.API.publicKey)) {
        self.api = api
    }
    
    func fetchPersonList(query: String, offset: Int) {
        self.api.characters.request(.list(limit: limit, offset: offset, query: query)) { (response) in
            switch response {
            case .success(let result):
                if let array = result.mapMappable(object: Person.self) {
                    self.output?.onFetch(result: .success(object: array))
                }else{
                    self.output?.onFetch(result: .failure(message: R.string.localizable.defaultError()))
                }
            case .failure(let error):
                self.output?.onFetch(result: .failure(message: "\(R.string.localizable.defaultError()) \n Error: \(error.localizedDescription)"))
            }
        }
    }
    
}
