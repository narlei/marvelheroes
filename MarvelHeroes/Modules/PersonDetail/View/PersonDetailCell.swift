//
//  PersonDetailCell.swift
//  MarvelHeroes
//
//  Created by Narlei A Moreira on 04/09/18.
//  Copyright © 2018 Narlei A Moreira. All rights reserved.
//

import UIKit

class PersonDetailCell: UITableViewCell {

    // MARK: Outlets
    
    @IBOutlet weak var labelType: UILabel!
    @IBOutlet weak var collectionViewItems: UICollectionView!
    
    // MARK: Vars
    var arrayWorkItems:[PersonWorkItem]! {
        didSet {
            self.collectionViewItems.reloadData()
        }
    }
    var sectionTitle:String!
    var type: WorkItemType!
    var presenter: PersonDetailPresentation?
    
    // MARK: Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionViewItems.register(R.nib.personDetailWorkCell(), forCellWithReuseIdentifier: "cellWork")
        self.collectionViewItems.dataSource = self
        self.collectionViewItems.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initialize(items:[PersonWorkItem], title: String, type: WorkItemType, presenter: PersonDetailPresentation?) {
        self.arrayWorkItems = items
        self.sectionTitle = title
        self.type = type
        self.presenter = presenter
        self.setup()
    }
    
    func setup() {
        self.labelType.text = self.sectionTitle
    }
}

extension PersonDetailCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = self.arrayWorkItems[indexPath.row]
        if let work = item.work {
            self.presenter?.didSelectItem(item: work)
        }
    }
}

extension PersonDetailCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayWorkItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewItems.dequeueReusableCell(withReuseIdentifier: "cellWork", for: indexPath) as! PersonDetailWorkCell
        let item = self.arrayWorkItems[indexPath.row]
        cell.initialize(item: item)
        self.presenter?.onLoadDetailCell(item: item, type: self.type)
        
        return cell
    }
    
    
}
