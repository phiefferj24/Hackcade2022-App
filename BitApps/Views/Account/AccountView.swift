//
//  AccountView.swift
//  Hackcade
//
//  Created by Jim Phieffer on 11/4/22.
//

import SwiftUI
import Glaip

struct AccountView: View {
    @ObservedObject var metamaskLogin = Glaip(title: "BitApps", description: "The NFT Game Store", supportedWallets: [.MetaMask])
    
    @AppStorage("user.wallet.address") var address: String = ""
    @AppStorage("user.wallet.chainId") var chainId: String = ""
    
    @AppStorage("user.library") var library: String = ""
    
    @State var fileViewDisplayed: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    if address.count > 0 {
                        Text("Logged In")
                        Button {
                            metamaskLogin.logout()
                            address = ""
                            chainId = ""
                        } label: {
                            Text("Logout")
                        }
                    } else {
                        Text("Not Logged In")
                        Button {
                            metamaskLogin.loginUser(type: .MetaMask, completion: { result in
                                switch result {
                                case .success(let user):
                                    address = user.wallet.address
                                    chainId = user.wallet.chainId
                                case .failure(let error): print(error)
                                }
                            })
                        } label: {
                            Text("Login with MetaMask")
                        }
                    }
                } header: {
                    Text("General")
                } footer: {
                    Text("Not working? Ensure you have the MetaMask app installed.")
                }
                Section {
                    Button {
                        fileViewDisplayed.toggle()
                    } label: {
                        Text("Upload a Game")
                    }.sheet(isPresented: $fileViewDisplayed) {
                        FileView(callback: { urls in
                            print("callback")
                            let url: URL = urls[0]
                            let data = try! Data(contentsOf: url)
                            var request = URLRequest(url: URL(string:"http://192.168.1.84:3000/game")!)
                            request.httpMethod = "POST"
                            request.httpBody = """
{
    "title": "\(url.lastPathComponent)",
    "author": "Jim Phieffer",
    "file": "\(data.map { String(format: "%02hhx", $0) }.joined())"
}
""".data(using: .utf8)
                            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                            Task {
                                if let (res, _) = try? await URLSession.shared.data(for: request) {
                                    if let jsonArray = try? JSONSerialization.jsonObject(with: res, options : .allowFragments) as? [String: Any] {
                                        let id = jsonArray["id"]
                                        let key = jsonArray["key"]
                                        library += "/\(id):\(key)"
                                        print(library)
                                    }
                                } else {
                                    print("nope")
                                }
                            }
                        })
                    }
                } header: {
                    Text("Games")
                }
            }.navigationTitle("Account")
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
