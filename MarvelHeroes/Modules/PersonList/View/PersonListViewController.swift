//
//  PersonListViewController.swift
//  MarvelHeroes
//
//  Created by Narlei A Moreira on 04/09/18.
//  Copyright © 2018 Narlei A Moreira. All rights reserved.
//

import UIKit
import UIScrollView_InfiniteScroll
import ANLoader

class PersonListViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Vars
    
    let searchController = UISearchController(searchResultsController: nil)
    
    // MARK: Vars
    var presenter: PersonListPresentation?
    var arrayPerson:[Person] = [Person]() {
        didSet {
            self.tableView.finishInfiniteScroll()
            self.refreshControl.endRefreshing()
            self.tableView.reloadData()
        }
    }
    var refreshControl: UIRefreshControl!
    
    // MARK: Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTableView()
        self.setupSearchBar()
        self.setupInfinityScroll()
        self.setupRefreshControl()
        self.setupLoader()
        self.setupPeekPop()
        
        self.presenter?.onViewDidLoad()
    }
    
    private func setupTableView() {
        self.tableView.register(R.nib.personListCell(), forCellReuseIdentifier: Constants.Cell.personList)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    private func setupSearchBar() {
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always

        searchController.searchBar.placeholder = R.string.localizable.search()
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.barStyle = .black
        searchController.searchBar.delegate = self
        searchController.searchBar.tintColor = .white

        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        definesPresentationContext = true
    }
    
    private func setupRefreshControl(){
        // Refresh Control
        self.refreshControl = UIRefreshControl()
        self.refreshControl.addTarget(self, action: #selector(self.reload), for: .valueChanged)
        self.tableView.addSubview(self.refreshControl)
    }
    
    private func setupInfinityScroll() {
        self.tableView.addInfiniteScroll { (tableView) -> Void in
            DispatchQueue.main.async {
                self.presenter?.onLoadMore()
            }
        }
    }
    
    private func setupLoader() {
        ANLoader.pulseAnimation = false
        ANLoader.activityColor = .white
        ANLoader.activityBackgroundColor = .clear
        ANLoader.activityTextColor = .white
        ANLoader.activityTextFontName = UIFont.systemFont(ofSize: 15)
    }
    
    private func setupPeekPop() {
        self.registerForPreviewing(with: self, sourceView: self.tableView)
    }
    
    @objc func reload() {
        self.presenter?.onReloadView()
    }
}

extension PersonListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.presenter?.search(query: searchBar.text ?? "")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.presenter?.onReloadView()
    }
}

extension PersonListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let person = self.arrayPerson[indexPath.row]
        self.presenter?.didSelectPerson(person: person)
    }
}

extension PersonListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayPerson.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cell.personList) as! PersonListCell
        let person = self.arrayPerson[indexPath.row]
        cell.initialize(person: person)
        
        return cell
    }
    
    
}

extension PersonListViewController: PersonListView {
    func showItems(array: [Person]) {
        self.arrayPerson = array
    }
    
    func showError(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: R.string.localizable.ok(), style: .cancel) { (UIAlertAction) in
        }
        
        alert.addAction(okAction)
        
        self.present(alert, animated: true) {
            
        }
    }
    
    func showLoad() {
        self.arrayPerson = [Person]()
        ANLoader.showLoading(R.string.localizable.loading(), disableUI: false)
    }
    
    func hideLoad() {
        ANLoader.hide()
    }
    
}

// MARK: Peek&Pop

extension PersonListViewController: UIViewControllerPreviewingDelegate{
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        if let indexPath = tableView.indexPathForRow(at: location) {
            previewingContext.sourceRect = tableView.rectForRow(at: indexPath)
            let person = self.arrayPerson[indexPath.row]
            return PersonDetailRouter.setupModule(person: person)
        }
        return nil
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        self.navigationController?.pushViewController(viewControllerToCommit, animated: true)
    }
}
