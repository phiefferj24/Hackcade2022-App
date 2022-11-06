//
//  LibraryDetailView.swift
//  Hackcade
//
//  Created by Jim Phieffer on 11/5/22.
//

import SwiftUI

struct LibraryDetailView: View {
    var title: String
    var subtitle: String
    
    @State var sellPresented = false
    
    @State var gameViewPresented = false
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomLeading) {
                Image("Tetris")
                    .resizable()
                    .scaledToFill()
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
                    Button {
                        gameViewPresented = true
                    } label: {
                        Image(systemName: "play.circle.fill")
                            .resizable()
                    }.frame(width: 40 , height: 40)
                        .sheet(isPresented: $gameViewPresented) {
                            GameView(gameDirectory: Bundle.main.url(forResource: "tetris", withExtension: "html")!)
                        }
                }.padding(10)
            }
            List {
                Section("Options") {
                    Button {
                        sellPresented = true
                    } label: {
                        Text("Sell Item")
                    }
                }
            }.listStyle(.plain)
            Spacer()
        }.sheet(isPresented: $sellPresented) {
            
        }
    }
}

struct LibraryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryDetailView(title: "", subtitle: "")
    }
}
