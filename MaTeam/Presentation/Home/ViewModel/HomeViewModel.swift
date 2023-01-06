//
//  HomeViewModel.swift
//  MaTeam
//
//  Created by Derouiche Elyes on 05/01/2023.
//

import Combine
import Foundation

protocol HomeViewModelProtocol: HasLeagueRepositoryProtocol {
    
    var searchText: String { get set }
    var teams: [Team] { get }
    var filteredLeagues: [League] { get }
    var state: HomeViewModel.HomeViewModelState { get }
    
    var searchTextPublisher: Published<String>.Publisher { get }
    var teamsPublisher: Published<[Team]>.Publisher { get }
    var filteredLeaguesPublisher: Published<[League]>.Publisher { get }
    
    // swiftlint:disable identifier_name
    var _leagues: [League] { get }
    
    var statePublisher: Published<HomeViewModel.HomeViewModelState>.Publisher { get }
    
    func filter(by text: String)
    func fetchLeagues() async
    func search(by league: String) async
}

class HomeViewModel: HomeViewModelProtocol {
    
    enum HomeViewModelState {
        case loading
        case idle
        case error
    }
    
    var leagueRepository: LeagueRepositoryProtocol
    
    @Published
    var searchText: String = ""
    var searchTextPublisher: Published<String>.Publisher { $searchText }
    
    @Published
    private(set) var teams: [Team] = []
    var teamsPublisher: Published<[Team]>.Publisher { $teams }
    
    @Published
    private(set) var filteredLeagues: [League] = []
    var filteredLeaguesPublisher: Published<[League]>.Publisher { $filteredLeagues }
    
    // swiftlint:disable identifier_name
    private(set) var _leagues: [League] = []
    
    @Published
    private(set) var state: HomeViewModelState = .loading
    var statePublisher: Published<HomeViewModelState>.Publisher { $state }
    
    private var cancellable = Set<AnyCancellable>()
    
    typealias Dependencies = HasLeagueRepositoryProtocol
    
    init(dependency: Dependencies) {
        self.leagueRepository = dependency.leagueRepository
        setupListener()
    }
    
    private func setupListener() {
        self.$searchText
            .debounce(for: 0.2, scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] text in
                self?.filter(by: text)
            }
            .store(in: &cancellable)
    }
    
    func filter(by text: String) {
        guard !text.isEmpty else {
            filteredLeagues = _leagues
            teams = []
            return
        }
        
        filteredLeagues = _leagues.filter {
            $0.strLeague.lowercased().contains(text.lowercased())
        }
    }
    
    func fetchLeagues() async {
        self.state = .loading
        do {
            _leagues = try await leagueRepository.getLeagues().leagues
            self.state = .idle
        } catch {
            self.state = .error
        }
    }
    
    func search(by league: String) async {
        guard !league.isEmpty else {
            teams = []
            return
        }
        
        self.state = .loading
        
        do {
            teams = try await leagueRepository.getAllTeamsLeague(by: league).teams
                .sorted { $0.strTeam > $1.strTeam }
            self.state = .idle
        } catch {
            self.state = .error
        }
    }
}
