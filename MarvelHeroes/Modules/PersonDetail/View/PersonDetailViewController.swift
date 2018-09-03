//
//  PersonDetailViewController.swift
//  MarvelHeroes
//
//  Created by Narlei A Moreira on 04/09/18.
//  Copyright © 2018 Narlei A Moreira. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var tableViewWorks: UITableView!
    
    
    // MARK: Vars
    var rowCount: Int = 0
    var presenter: PersonDetailPresentation?
    
    var arraySections = [(key: String, list: [PersonWorkItem], type: WorkItemType)]() {
        didSet {
            self.tableViewWorks.reloadData()
        }
    }
    
    // MARK: Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.onViewDidLoad()
        self.setup()
    }

    func setup() {
        self.tableViewWorks.register(R.nib.personDetailCell(), forCellReuseIdentifier: Constants.Cell.personDetail)
        self.tableViewWorks.delegate = self
        self.tableViewWorks.dataSource = self
    }
    
}

extension PersonDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension PersonDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arraySections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cell.personDetail) as! PersonDetailCell
        let item = self.arraySections[indexPath.row]
        cell.initialize(items: item.list, title: item.key, type: item.type, presenter: self.presenter)

        return cell
    }
    
}


extension PersonDetailViewController: PersonDetailView {
    func showDetails(sections: [(key: String, list: [PersonWorkItem], type: WorkItemType)]) {
        self.arraySections = sections
    }
    
    func setTitle(person: Person) {
        self.title = person.name
    }
    
    func reloadPerson() {
//        self.tableViewWorks.reloadData()
    }
}
