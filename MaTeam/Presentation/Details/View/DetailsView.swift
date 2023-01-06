//
//  ContentView.swift
//  MaTeam
//
//  Created by Derouiche Elyes on 05/01/2023.
//

import SwiftUI

struct DetailsView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: DetailsViewModel
    
    var body: some View {
        StickyHeaderContainer(header: AsyncImage(url: viewModel.headerUrl) { image in
            image
                .resizable()
        } placeholder: {
            Color.clear
        }
            .padding(.top, 40), content: {
                VStack {
                    
                    AsyncImage(url: viewModel.logoUrl) { image in
                        image
                            .resizable()
                        
                    } placeholder: {
                        Color.clear
                    }
                    .frame(width: 200, height: 150, alignment: .center)
                    .offset(y: -50)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        if !viewModel.paysInfo.isEmpty {
                            Text("Pays origine")
                                .bold()
                            Text(viewModel.paysInfo)
                        }
                        
                        if !viewModel.championnat.isEmpty {
                            Text("Championnat:")
                                .bold()
                            Text(viewModel.championnat)
                        }
                        
                        if !viewModel.description.isEmpty {
                            Text("Description:")
                                .bold()
                            Text(viewModel.description)
                        }
                    }
                    .padding()
                }
            })
        .alert(isPresented: Binding(get: {
            viewModel.state == .error
        }, set: { _ in }), content: {
            Alert(title: Text("Error Loading content"), message: Text("Could not load content properly"), dismissButton: .destructive(Text("OK"), action: {
                dismiss()
            }))
        })
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModelFactory: ViewModelFactory = .init()
        DetailsView(viewModel: viewModelFactory.buildDetailsViewModel(name: "Paris SG"))
    }
}
