//
//  LibraryItemView.swift
//  Hackcade
//
//  Created by Jim Phieffer on 11/5/22.
//

import SwiftUI

struct LibraryItemView: View {
    var title: String
    var subtitle: String
    var action: () -> Void
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomLeading) {
                Image("Tetris")
                    .resizable()
                    .scaledToFit()
                Rectangle()
                    .foregroundColor(.clear)
                    .background(LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .center, endPoint: .bottom))
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading) {
                        Spacer()
                        Text(title)
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                        Text(subtitle)
                            .italic()
                            .foregroundColor(Color(red: 0.8, green: 0.8, blue: 0.8))
                    }
                    Spacer()
                }.padding(10)
            }.clipShape(RoundedRectangle(cornerRadius: 15))
        }.onTapGesture(perform: action)
    }
}

struct LibraryItemView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryItemView(title: "Tetris", subtitle: "by Jim Phieffer", action: {})
    }
}
