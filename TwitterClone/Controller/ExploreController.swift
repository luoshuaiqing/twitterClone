//
//  ExploreController.swift
//  TwitterClone
//
//  Created by 罗帅卿 on 12/18/20.
//

import UIKit

private let reuseIdentifier = "UserCell"

class ExploreController: UITableViewController {

    // MARK: - Properties
    
    private var users = [User]() {
        didSet { tableView.reloadData() }
    }
    
    private var filteredUsers = [User]() {
        didSet { tableView.reloadData() }
    }
    
    private var inSearchMode: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return searchController.isActive && !text.isEmpty
    }
    
    // MARK: - Lifecycles
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchUsers()
        configureSearchController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barStyle = .default // the nav bar will have a separatar line
        navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: - API

    func fetchUsers() {
        UserService.shared.fetchUsers { (users) in
            self.users = users
        }
    }
    
    // MARK: - Helpers

    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Explore"
        
        tableView.register(UserCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 60
        tableView.separatorStyle = .none
    }
    
    func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Search for a user..."
        navigationItem.searchController = searchController
        definesPresentationContext = false
    }
}

// MARK: - UITableViewDelegate/Datasource

extension ExploreController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inSearchMode ? filteredUsers.count : users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! UserCell
        cell.user = inSearchMode ? filteredUsers[indexPath.row] : users[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = inSearchMode ? filteredUsers[indexPath.row] : users[indexPath.row]
        let controller = ProfileController(user: user)
        navigationController?.pushViewController(controller, animated: true)
    }
}



extension ExploreController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text?.lowercased() else { return }
        
        filteredUsers = users.filter({ $0.userName.lowercased().contains(searchText) || $0.fullName.lowercased().contains(searchText) })
    }
}
