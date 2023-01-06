//
//  StickyHeaderContainer.swift
//  MaTeam
//
//  Created by Derouiche Elyes on 06/01/2023.
//

import SwiftUI

struct StickyHeaderContainer<Header: View, Content: View>: View {
    
    var minHeight: CGFloat
    var content: Content
    var header: Header
    
    init(minHeight: CGFloat = 200, header: Header, @ViewBuilder content: () -> Content) {
        self.minHeight = minHeight
        self.content = content()
        self.header = header
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            GeometryReader { geo in
                // swiftlint:disable control_statement
                if(geo.frame(in: .global).minY <= 0) {
                    header
                        .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                } else {
                    header
                        .offset(y: -geo.frame(in: .global).minY)
                        .frame(width: geo.size.width, height: geo.size.height + geo.frame(in: .global).minY)
                }
            }
            .frame(minHeight: minHeight)
            
            content
        }
    }
}

struct StickyHeaderContainer_Previews: PreviewProvider {
    static var previews: some View {
        
        StickyHeaderContainer(header: Image(systemName: "pin")
            .resizable()
            .padding(.top, 50), content: {
            HStack {
                Spacer()
                Spacer()
                Text("Content")
            }
        })
    }
}
