//
//  SearchResultViewController.swift
//  MaTeam
//
//  Created by Derouiche Elyes on 05/01/2023.
//

import UIKit

class SearchResultViewController: UIViewController {
    
    typealias TableViewDelegate = (UITableViewDelegate & UITableViewDataSource)
    weak var delegate: (TableViewDelegate)?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    convenience init(delegate: TableViewDelegate) {
        self.init(nibName: nil, bundle: nil)
        self.delegate = delegate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
        setupViews()
        setupConstraint()
    }
    
    fileprivate func setupViews() {
        view.addSubview(tableView)
    }
    
    fileprivate func setupConstraint() {
        tableView.fillSuperview()
    }
    
    fileprivate func setupTableView() {
        // Set up collection view
        tableView
            .register(UITableViewCell.self, forCellReuseIdentifier: "defaultCell")
        tableView.dataSource = delegate
        tableView.delegate = delegate
    }
}
