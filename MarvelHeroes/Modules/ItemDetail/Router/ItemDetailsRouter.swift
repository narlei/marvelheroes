//
//  ItemDetailsRouter.swift
//  movieFinder
//
//  Created by Narlei A Moreira on 05/08/18.
//  Copyright © 2018 Narlei A Moreira. All rights reserved.
//

import Foundation
import UIKit

class ItemDetailsRouter: ItemDetailsWireframe {
    
    static func assembleModule(object: BaseWork) -> UIViewController {
        
        let view = R.storyboard.itemDetails().instantiateInitialViewController() as! ItemDetailsViewController
        let presenter = ItemDetailsPresenter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = ItemDetailsInteractor()
        presenter.object = object
        presenter.interactor.output = presenter
        
        return view
    }
}
