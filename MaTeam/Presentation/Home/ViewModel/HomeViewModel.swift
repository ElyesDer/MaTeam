//
//  HomeViewModel.swift
//  MaTeam
//
//  Created by Derouiche Elyes on 05/01/2023.
//

import Foundation

protocol HomeViewModelProtocol: HasLeagueRepositoryProtocol { }

class HomeViewModel: HomeViewModelProtocol {

    enum HomeViewModelState {
        case loading
        case idle
        case error
    }
    
    var leagueRepository: LeagueRepositoryProtocol
    
    @Published private(set) var searchText: String = ""
    @Published private(set) var teans: [Team] = []
    @Published private(set) var state: HomeViewModelState = .loading
    
    typealias Dependencies = HasLeagueRepositoryProtocol
    
    init(dependency: Dependencies) {
        self.leagueRepository = dependency.leagueRepository
    }
    
    // on value did change
    func search() {
        
    }
    
}
