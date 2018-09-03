//
//  PersonDetailWorkCell.swift
//  MarvelHeroes
//
//  Created by Narlei A Moreira on 04/09/18.
//  Copyright © 2018 Narlei A Moreira. All rights reserved.
//

import UIKit
import Foundation
import Moya


class PersonDetailWorkCell: UICollectionViewCell {
    
    // MARK: Outlets
    
    @IBOutlet weak var imageViewCover: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    
    // MARK: Var
    var item: PersonWorkItem!
    
    func initialize(item: PersonWorkItem) {
        self.item = item
        self.setup()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.setup), name: NSNotification.Name(rawValue:"NOTIFIE\(item.getId()!)"), object: nil)
    }
    
    
    
    @objc func setup(){
        self.labelTitle.text = self.item.name
        self.imageViewCover.image = UIImage()
        
        if let work = item.work {
            self.imageViewCover.load(thumbnail: work.thumbnail, size: .portrait_uncanny) { (image) in
                NotificationCenter.default.removeObserver(self)
            }
        }
    }
    
}
