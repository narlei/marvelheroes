//
//  PersonDetailContract.swift
//  MarvelHeroes
//
//  Created by Narlei A Moreira on 04/09/18.
//  Copyright © 2018 Narlei A Moreira. All rights reserved.
//

import Foundation

protocol PersonDetailView: class {
    var presenter: PersonDetailPresentation? {get set}
    
    func showDetails(sections:[(key: String, list: [PersonWorkItem], type: WorkItemType)])
    func setTitle(person: Person)
    func reloadPerson()
}

protocol PersonDetailPresentation: class {
    var view: PersonDetailView? {get set}
    var router: PersonDetailWireFrame {get set}
    var interactor: PersonDetailUseCase {get set}
    
    func onViewDidLoad()
    func onLoadDetailCell(item: PersonWorkItem, type: WorkItemType)
    func didSelectItem(item: BaseWork)
    
}

protocol PersonDetailUseCase: class {
    var output: PersonDetailInteractorOutput? {get set}
   
    func fetchSectionsData(person: Person)
    func fetchWork(item: PersonWorkItem, type: WorkItemType)
}

protocol PersonDetailInteractorOutput: class {
    func onFetched(sections: [(key: String, list: [PersonWorkItem], type: WorkItemType)])
    func onWorkSuccess(item: PersonWorkItem)
}

protocol PersonDetailWireFrame: class {
    func openDetail(object: BaseWork)
}
