//
//  LibraryView.swift
//  Hackcade
//
//  Created by Jim Phieffer on 11/5/22.
//

import SwiftUI

struct LibraryView: View {
    @AppStorage("user.library") var library: String = ""
    
    @State var detailViewPresented: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                LibraryItemView(title: "Tetris", subtitle: "by Jim Phieffer") {
                    detailViewPresented = true
                }.sheet(isPresented: $detailViewPresented) {
                    LibraryDetailView(title: "Tetris", subtitle: "by Jim Phieffer")
                }
            }.navigationTitle("Library")
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
