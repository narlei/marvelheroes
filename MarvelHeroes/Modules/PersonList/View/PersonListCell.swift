//
//  PersonListCell.swift
//  MarvelHeroes
//
//  Created by Narlei A Moreira on 04/09/18.
//  Copyright © 2018 Narlei A Moreira. All rights reserved.
//

import UIKit

class PersonListCell: UITableViewCell {

    // MARK: Outlets
    
    @IBOutlet weak var imageViewCover: UIImageView!
    @IBOutlet weak var labelName: UILabel!

    // MARK: Vars
    var person: Person?
    
    // MARK: Methods
    
    func initialize(person: Person) {
        self.person = person
        self.labelName?.text = person.name
        self.imageViewCover?.load(thumbnail: person.thumbnail, size: .portrait_small, onComplete: { (image) in  
        })
    }

}
