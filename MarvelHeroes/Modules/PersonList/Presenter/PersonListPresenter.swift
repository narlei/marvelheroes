//
//  PersonListPresenter.swift
//  MarvelHeroes
//
//  Created by Narlei A Moreira on 04/09/18.
//  Copyright © 2018 Narlei A Moreira. All rights reserved.
//

import Foundation

class PersonListPresenter: PersonListPresentation {
    weak var view: PersonListView?
    var router: PersonListWireFrame
    var interactor: PersonListUseCase
    var arrayPerson:[Person] = [Person]()
    var searchQuery:String = ""
    
    func onViewDidLoad() {
        self.fetchList()
    }
    
    func didSelectPerson(person: Person) {
        self.router.openDetail(person: person)
    }
    
    func onReloadView(){
        self.arrayPerson = [Person]()
        self.searchQuery = ""
        self.fetchList()
    }
    
    func onLoadMore() {
        self.fetchList()
    }
    
    func search(query: String) {
        if self.searchQuery == "" {
            self.arrayPerson = [Person]()
        }
        self.searchQuery = query
        self.fetchList()
    }
    
    private func fetchList() {
        if self.arrayPerson.count == 0 {
            self.view?.showLoad()
        }
        self.interactor.fetchPersonList(query: self.searchQuery, offset: self.arrayPerson.count)
    }
    
    init(router: PersonListWireFrame, interactor: PersonListUseCase) {
        self.router = router
        self.interactor = interactor
    }
}

extension PersonListPresenter: PersonListInteractorOutput {
    func onFetch(result: MHResult<[Person]>) {
        switch result {
        case .success(let list):
            self.arrayPerson = self.arrayPerson + list
            self.view?.showItems(array: self.arrayPerson)
            self.view?.hideLoad()
        case .failure(let message):
            self.view?.showError(message: message)
            self.view?.hideLoad()
        }
    }
}
