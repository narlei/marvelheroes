//
//  PersonDetailInteractor.swift
//  MarvelHeroes
//
//  Created by Narlei A Moreira on 04/09/18.
//  Copyright © 2018 Narlei A Moreira. All rights reserved.
//

import Foundation

class PersonDetailInteractor: PersonDetailUseCase {
    var output: PersonDetailInteractorOutput?
    private var api: MarvelAPI
    
    init(api:MarvelAPI = MarvelAPI(baseURL: Constants.API.baseAddress, privateKey: Constants.API.privateKey, publicKey: Constants.API.publicKey)) {
        self.api = api
    }
    
    func fetchSectionsData(person: Person) {
        var arrayReturn = [(key: String, list: [PersonWorkItem], type: WorkItemType)]()

        if let items = person.comics?.items, items.count > 0 {
            arrayReturn.append((key: "Comics", list: items, type: .comic))
        }
        if let items = person.series?.items, items.count > 0 {
            arrayReturn.append((key: "Series", list: items, type: .serie))
        }
        if let items = person.events?.items, items.count > 0 {
            arrayReturn.append((key: "Events", list: items, type: .event))
        }
        if let items = person.stories?.items, items.count > 0 {
            arrayReturn.append((key: "Stories", list: items, type: .story))
        }
        self.output?.onFetched(sections: arrayReturn)
    }
    
    func fetchWork(item: PersonWorkItem, type: WorkItemType) {
        switch type {
        case .comic:
            api.comics.request(.detail(id: item.getId()!)) {[weak item] (response) in
                switch response {
                case .success(let result):
                    if let object = result.mapMappable(object: Comic.self)?.first, let weakItem = item {
                        weakItem.work = object
                        self.output?.onWorkSuccess(item: weakItem)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        case .event:
            api.events.request(.detail(id: item.getId()!)) {[weak item] (response) in
                switch response {
                case .success(let result):
                    if let object = result.mapMappable(object: Event.self)?.first, let weakItem = item {
                        weakItem.work = object
                        self.output?.onWorkSuccess(item: weakItem)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            break
        case .serie:
            api.series.request(.detail(id: item.getId()!)) {[weak item] (response) in
                switch response {
                case .success(let result):
                    if let object = result.mapMappable(object: Serie.self)?.first, let weakItem = item {
                        weakItem.work = object
                        self.output?.onWorkSuccess(item: weakItem)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            break
        case .story:
            api.stories.request(.detail(id: item.getId()!)) {[weak item] (response) in
                switch response {
                case .success(let result):
                    if let object = result.mapMappable(object: Serie.self)?.first, let weakItem = item {
                        weakItem.work = object
                        self.output?.onWorkSuccess(item: weakItem)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            break
            
        }
    }
}
