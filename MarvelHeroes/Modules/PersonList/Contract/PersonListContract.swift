//
//  PersonListContract.swift
//  MarvelHeroes
//
//  Created by Narlei A Moreira on 04/09/18.
//  Copyright © 2018 Narlei A Moreira. All rights reserved.
//

import Foundation

protocol PersonListView: class {
    var presenter: PersonListPresentation? {get set}
    
    func showItems(array: [Person])
    func showError(message: String)
    func hideLoad()
    func showLoad()
}

protocol PersonListPresentation: class {
    var view: PersonListView? {get set}
    var router: PersonListWireFrame {get set}
    var interactor: PersonListUseCase {get set}
    
    func onViewDidLoad()
    func onReloadView()
    func onLoadMore()
    func didSelectPerson(person: Person)
    func search(query: String)
}

protocol PersonListUseCase: class {
    var output: PersonListInteractorOutput? {get set}
    
    func fetchPersonList(query: String, offset: Int)
}

protocol PersonListInteractorOutput: class {
    func onFetch(result: MHResult<[Person]>)
}

protocol PersonListWireFrame: class {
    func openDetail(person: Person)
}
