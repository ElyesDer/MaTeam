//
//  HomeViewController.swift
//  MaTeam
//
//  Created by Derouiche Elyes on 05/01/2023.
//

import UIKit
import Inject

class HomeViewController: UIViewController {
    
    // Initialize views
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
    lazy var activityIndicationView = UIActivityIndicatorView(style: .medium)
    
    // Search controller
    lazy var searchController: UISearchController = {
        UISearchController(searchResultsController: nil)
    }()
    
    // setup viewModel
    let viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupSearchController()
    }
    
    func setupCollectionView() {
        // Set up collection view
        collectionView.dataSource = self
        collectionView.delegate = self
        //        collectionView.refreshControl = searchController.searchBar
    }
    
    func setupSearchController() {
        // Set up search controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Leagues"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return .init()
    }
}

extension HomeViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}
