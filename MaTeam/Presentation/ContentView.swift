//
//  ContentView.swift
//  MaTeam
//
//  Created by Derouiche Elyes on 05/01/2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var factory: ViewModelFactory
    
    var body: some View {
        HomeViewRepresentable()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
