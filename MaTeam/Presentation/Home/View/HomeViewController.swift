//
//  HomeViewController.swift
//  MaTeam
//
//  Created by Derouiche Elyes on 05/01/2023.
//

import UIKit
import Combine

class HomeViewController: UIViewController {
    
    // Initialize views
    lazy var collectionView: UICollectionView = {
        
        // setup layout
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 100, height: 100)
        flowLayout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        return collectionView
    }()
    
    lazy var activityIndicationView: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    // Search controller
    lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: SearchResultViewController(delegate: self))
        return searchController
    }()
    
    // setup properties
    private var cancellable = Set<AnyCancellable>()
    
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
        setupViews()
        setupConstraints()
        
        // setup binding
        bindViewModelToView()
    }
}

// MARK: - Setup Search result Delegate

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.filteredLeagues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
        cell.textLabel?.text = self.viewModel.filteredLeagues[indexPath.row].strLeague
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let leagueName: String = self.viewModel.filteredLeagues[indexPath.row].strLeague
        self.viewModel.search(by: leagueName)
        
        guard let searchResultController = self.searchController.searchResultsController as? SearchResultViewController else { return }
        self.searchController.searchBar.text = leagueName
        searchResultController.dismiss(animated: true)
    }
}

// MARK: - Setup constraint

extension HomeViewController {
    
    // setup binding
    
    func bindViewModelToView() {
        
        viewModel.$filteredLeagues
            .receive(on: RunLoop.main)
            .sink { _ in
                guard let searchResultController = self.searchController.searchResultsController as? SearchResultViewController else { return }
                searchResultController.tableView.reloadData()
            }
            .store(in: &cancellable)
        
        viewModel.$teams
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] _ in
                // update data source
                self?.collectionView.reloadData()
            })
            .store(in: &cancellable)
        
        let stateValueHandler: (HomeViewModel.HomeViewModelState) -> Void = { [weak self] state in
            switch state {
                case .loading:
                    self?.activityIndicationView.startAnimating()
                case .idle:
                    self?.activityIndicationView.stopAnimating()
                case .error:
                    self?.activityIndicationView.stopAnimating()
                    print("Show alert")
            }
        }
        
        viewModel.$state
            .receive(on: RunLoop.main)
            .sink(receiveValue: stateValueHandler)
            .store(in: &cancellable)
    }
    
    fileprivate func setupViews() {
        collectionView.addSubview(activityIndicationView)
        view.addSubview(collectionView)
    }
    
    fileprivate func setupConstraints() {
        collectionView
            .anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
        
        NSLayoutConstraint.activate([
            activityIndicationView.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor),
            activityIndicationView.centerYAnchor.constraint(equalTo: collectionView.centerYAnchor),
            activityIndicationView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    fileprivate func setupCollectionView() {
        // Set up collection view
        collectionView.register(TeamCollectionViewCell.self, forCellWithReuseIdentifier: TeamCollectionViewCell.reuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        //        collectionView.refreshControl = searchController.searchBar
    }
    
    fileprivate func setupSearchController() {
        // Set up search controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Leagues"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
}

// MARK: - Setup Collection View Delegate

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.teams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TeamCollectionViewCell.reuseIdentifier, for: indexPath) as? TeamCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.setup(model: viewModel.teams[indexPath.row])
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 50
        let collectionViewSize = collectionView.frame.size.width - padding
        
        return CGSize(width: collectionViewSize / 2, height: collectionViewSize / 2)
    }
}

// MARK: - Setup Search result Controller

extension HomeViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        viewModel.searchText = text
    }
}
