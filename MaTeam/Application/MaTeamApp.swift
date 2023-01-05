//
//  MaTeamApp.swift
//  MaTeam
//
//  Created by Derouiche Elyes on 05/01/2023.
//

import SwiftUI

@main
struct MaTeamApp: App {
    var viewModelFactory: ViewModelFactory = .init()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModelFactory)
        }
    }
}
