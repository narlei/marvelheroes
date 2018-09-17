//
//  PersonDetailPresenter.swift
//  MarvelHeroes
//
//  Created by Narlei A Moreira on 04/09/18.
//  Copyright © 2018 Narlei A Moreira. All rights reserved.
//

import Foundation

class PersonDetailPresenter: PersonDetailPresentation {
    var view: PersonDetailView?
    var router: PersonDetailWireFrame
    var interactor: PersonDetailUseCase
    var person: Person
    
    func onViewDidLoad() {
        self.interactor.fetchSectionsData(person: self.person)
        self.view?.setTitle(person: person)
    }
    
    func didSelectItem(item: BaseWork) {
        self.router.openDetail(object: item)
    }
    
    func onLoadDetailCell(item: PersonWorkItem, type: WorkItemType) {
        if item.work != nil {
            return
        }
        self.interactor.fetchWork(item: item, type: type)
    }
    
    init(router: PersonDetailWireFrame, interactor: PersonDetailUseCase, person: Person) {
        self.router = router
        self.interactor = interactor
        self.person = person
    }
    
}

extension PersonDetailPresenter: PersonDetailInteractorOutput {
    func onFetched(sections: [(key: String, list: [PersonWorkItem], type: WorkItemType)]) {
        self.view?.showDetails(sections: sections)
    }
    
    func onWorkSuccess(item: PersonWorkItem) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue:"NOTIFIE\(item.getId()!)"), object: nil)
        self.view?.reloadPerson()
    }
}
