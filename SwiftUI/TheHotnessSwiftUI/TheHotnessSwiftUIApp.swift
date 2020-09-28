//
//  TheHotnessSwiftUIApp.swift
//  TheHotnessSwiftUI
//
//  Created by Petteri Kamppuri on 28.9.2020.
//

import SwiftUI

@main
struct TheHotnessSwiftUIApp: App {
    @StateObject var bggApi = BGGApi()
    
    var body: some Scene {
        WindowGroup {
            GameListView(theHotness: bggApi.theHotness())
                .environmentObject(bggApi)
        }
    }
}
