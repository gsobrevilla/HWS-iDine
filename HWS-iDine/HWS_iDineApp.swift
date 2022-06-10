//
//  HWS_iDineApp.swift
//  HWS-iDine
//
//  Created by Gastón on 09/06/2022.
//

import SwiftUI

@main
struct HWS_iDineApp: App {
    
    @StateObject var order = Order()
    @StateObject var favorites = Favorites()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
                .environmentObject(favorites)
        }
    }
}
