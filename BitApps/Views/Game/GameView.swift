//
//  GameView.swift
//  Hackcade
//
//  Created by Jim Phieffer on 11/5/22.
//

import SwiftUI
import UIKit
import WebKit

struct GameView: View {
    var gameDirectory: URL
    
    var body: some View {
        NavigationView {
            WebView(url: gameDirectory)
                .edgesIgnoringSafeArea(.bottom)
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button {
                            
                        } label: {
                            Text("Exit")
                        }
                    }
                }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(gameDirectory: Bundle.main.url(forResource: "tetris", withExtension: "html")!)
    }
}

struct WebView: UIViewRepresentable {
    var url: URL
    let webView = WKWebView()

    func makeUIView(context: Context) -> WKWebView {
        webView.load(URLRequest(url: url))
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {}
}
