//
//  XsAndOsApp.swift
//  XsAndOs
//
//  Created by Nick Pavlov on 6/3/23.
//

import SwiftUI

@main
struct AppEntry: App {
    @AppStorage("yourName") var yourName = ""
    @StateObject var game = GameService()
    
    var body: some Scene {
        WindowGroup {
            if yourName.isEmpty {
                YourNameView()
            } else {
                StartView(yourName: yourName)
                    .environmentObject(game)
            }
        }
    }
}
