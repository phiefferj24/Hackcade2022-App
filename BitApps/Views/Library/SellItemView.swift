//
//  SellItemView.swift
//  BitApps
//
//  Created by Jim Phieffer on 11/6/22.
//

import SwiftUI

struct SellItemView: View {
    @State var price: Double = 0.0
    
    var body: some View {
        List {
            TextField("Price (ETH)", value: $price, format: .number)
            Button {
                
            } label: {
                Text("Confirm Sale")
            }
        }
    }
}

struct SellItemView_Previews: PreviewProvider {
    static var previews: some View {
        SellItemView()
    }
}
