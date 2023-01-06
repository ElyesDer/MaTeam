//
//  HomeViewRepresentable.swift
//  MaTeam
//
//  Created by Derouiche Elyes on 05/01/2023.
//

import Foundation
import SwiftUI

struct HomeViewRepresentable: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = HomeViewController
    
    @EnvironmentObject var factory: ViewModelFactory
    
    func makeUIViewController(context: Context) -> HomeViewController {
        let homeViewController = HomeViewController(viewModel: factory.buildHomeViewModel())
        
        return homeViewController
    }
    
    func updateUIViewController(_ uiViewController: HomeViewController, context: Context) {
        
    }
    
}
