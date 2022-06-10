//
//  Favorites.swift
//  HWS-iDine
//
//  Created by Gastón on 10/06/2022.
//

import Foundation

class Favorites: ObservableObject {
    
    @Published var items: [MenuItem] = []
    
    func add(item: MenuItem) {
        items.append(item)
    }
    
    func remove(item: MenuItem) {
        items.removeAll(where: { $0.id == item.id })
    }
    
    func isFavorite(item: MenuItem) -> Bool {
        return items.contains(where: { $0.id == item.id })
    }
}
