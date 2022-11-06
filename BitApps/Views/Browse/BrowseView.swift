//
//  BrowseView.swift
//  Hackcade
//
//  Created by Jim Phieffer on 11/4/22.
//

import SwiftUI

struct BrowseView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                BrowseItemView(title: "Space Invaders", subtitle: "by Jim Phieffer", image: "SpaceInvaders", priceEth: 0.92, priceUSD: 1491.45, action: {})
                BrowseItemView(title: "Pong", subtitle: "by Alex Nanda", image: "Pong", priceEth: 0.61, priceUSD: 988.90, action: {})
            }.padding()
                .navigationTitle("Browse")
        }
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView()
    }
}
