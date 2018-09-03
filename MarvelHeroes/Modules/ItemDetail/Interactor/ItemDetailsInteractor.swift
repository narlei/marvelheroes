//
//  ItemDetailsInteractor.swift
//  movieFinder
//
//  Created by Narlei A Moreira on 05/08/18.
//  Copyright © 2018 Narlei A Moreira. All rights reserved.
//

import Foundation

class ItemDetailsInteractor: ItemDetailsUseCase {
    
    weak var output: ItemDetailsInteractorOutput?
    
    func load(object: BaseWork) {
        if let obj = object as? Comic {
            self.output?.showDetails(for: obj)
            return
        }
        if let obj = object as? Event {
            self.output?.showDetails(for: obj)
            return
        }
        if let obj = object as? Serie {
            self.output?.showDetails(for: obj)
            return
        }
        if let obj = object as? Story {
            self.output?.showDetails(for: obj)
            return
        }
    }
}
