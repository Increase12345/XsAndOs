//
//  XsAndOsApp.swift
//  XsAndOs
//
//  Created by Nick Pavlov on 6/3/23.
//

import SwiftUI

@main
struct AppEntry: App {
    @StateObject var game = GameService()
    
    var body: some Scene {
        WindowGroup {
            StartView()
                .environmentObject(game)
        }
    }
}
