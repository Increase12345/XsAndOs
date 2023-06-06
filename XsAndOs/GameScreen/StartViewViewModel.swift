//
//  StartViewViewModel.swift
//  XsAndOs
//
//  Created by Nick Pavlov on 6/6/23.
//

import SwiftUI

class StartViewViewModel: ObservableObject {
    @Published var opponentName = ""
    @Published var startGame = false
    @Published var changeName = false
    @Published var newName = ""
}
