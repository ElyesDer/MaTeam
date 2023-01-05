//
//  ViewModelFactory.swift
//  MaTeam
//
//  Created by Derouiche Elyes on 05/01/2023.
//

import Foundation

protocol ViewModelFactoryProtocol: HasDataServiceProviderProtocol, HasLeagueRepositoryProtocol {}

class ViewModelFactory: ObservableObject, ViewModelFactoryProtocol {
    
    var requester: DataServiceProviderProtocol
    var leagueRepository: LeagueRepositoryProtocol
    
    init(requester: DataServiceProviderProtocol = Requester(), leagueRepository: LeagueRepositoryProtocol = LeagueRepository(requester: Requester())) {
        self.requester = Requester()
        self.leagueRepository = LeagueRepository(requester: self.requester)
    }
    
    func buildHomeViewModel() -> HomeViewModel {
        return HomeViewModel(dependency: self)
    }
    
}
