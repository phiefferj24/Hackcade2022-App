//
//  BrowseItemView.swift
//  Hackcade
//
//  Created by Jim Phieffer on 11/4/22.
//

import SwiftUI

struct BrowseItemView: View {
    
    var title: String
    var subtitle: String
    var image: String
    var priceEth: Double
    var priceUSD: Double
    var action: () -> Void
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomLeading) {
                Image(image)
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
                    VStack(alignment: .trailing) {
                        HStack {
                            Image("Polygon")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .scaledToFit()
                            Text(String(format: "%.2f", priceEth))
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.white)
                        }
                        .padding(.bottom, -10)
                        Text("\(String(format: "%.2f", priceUSD)) USD")
                            .italic()
                            .foregroundColor(Color(red: 0.8, green: 0.8, blue: 0.8))
                    }
                }.padding(10)
            }.clipShape(RoundedRectangle(cornerRadius: 15))
        }.onTapGesture(perform: action)
    }
}

struct BrowseItemView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseItemView(title: "Tetris", subtitle: "by Jim Phieffer", image: "Tetris", priceEth: 2.1, priceUSD: 2544.21, action: {})
    }
}
