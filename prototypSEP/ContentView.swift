//
//  ContentView.swift
//  prototypSEP
//
//  Created by Jan Dettler on 27.04.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView { //
            SellerPrototypView()
                .tabItem {
                    Label("LogIN", systemImage: "person")
                }
            
            CustomerPrototypView()
                .tabItem {
                    Label("Erkunden", systemImage: "location")
                }
            MapView()
                .tabItem {
                    Label("Einstellungen", systemImage: "gear")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
