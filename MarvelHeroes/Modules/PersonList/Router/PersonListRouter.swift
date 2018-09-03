//
//  PersonListRouter.swift
//  MarvelHeroes
//
//  Created by Narlei A Moreira on 04/09/18.
//  Copyright © 2018 Narlei A Moreira. All rights reserved.
//

import UIKit

class PersonListRouter: PersonListWireFrame {
    
    var viewController: UIViewController?
    
    func openDetail(person: Person) {
        let viewController = PersonDetailRouter.setupModule(person: person)
        self.viewController?.navigationController?.pushViewController(viewController, animated: true)
    }
    
    static func assembleModule() -> UINavigationController {
        
        let navigation = R.storyboard.personList().instantiateInitialViewController() as! UINavigationController
        let viewC = navigation.viewControllers.first as! PersonListViewController
        let interactor = PersonListInteractor()
        let router = PersonListRouter()
        let presenter = PersonListPresenter(router: router, interactor: interactor)
        
        viewC.presenter = presenter
        presenter.view = viewC
        interactor.output = presenter
        
        router.viewController = viewC
        
        return navigation
        
    }
}
