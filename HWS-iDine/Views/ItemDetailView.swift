//
//  ItemDetail.swift
//  HWS-iDine
//
//  Created by Gastón on 09/06/2022.
//

import SwiftUI

struct ItemDetailView: View {
    
    let item: MenuItem
    
    @EnvironmentObject var order: Order
    @EnvironmentObject var favorites: Favorites
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            
            Text(item.description)
                .padding()
            
            Button("Order this") {
                order.add(item: item)
            }
            .padding()
            .font(.headline)
            .background(.green)
            .foregroundColor(.white)
            .cornerRadius(10)
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            // Favorite button
            Button {
                if favorites.isFavorite(item: item) {
                    favorites.remove(item: item)
                } else {
                    favorites.add(item: item)
                }
            } label: {
                if favorites.isFavorite(item: item) {
                    Image(systemName: "heart.fill")
                        .symbolRenderingMode(.multicolor)
                } else {
                    Image(systemName: "heart")
                        .symbolRenderingMode(.multicolor)
                }
                
            }
        }
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetailView(item: MenuItem.example)
                .environmentObject(Order())
                .environmentObject(Favorites())
        }
    }
}
