//
//  StartView.swift
//  XsAndOs
//
//  Created by Nick Pavlov on 6/3/23.
//

import SwiftUI

struct StartView: View {
    @State private var gameType: GameType = .undetermined
    @State private var yourName = ""
    @State private var opponentName = ""
    @FocusState private var focus: Bool
    
    var body: some View {
        VStack {
            Picker("Select Game", selection: $gameType) {
                Text("Select Game Type")
                    .tag(GameType.undetermined)
                Text("Two Sharing device")
                    .tag(GameType.single)
                Text("Challenge your device")
                    .tag(GameType.bot)
                Text("Challenge a friend")
                    .tag(GameType.peer)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(lineWidth: 2))
            .tint(.primary)
            
            Text(gameType.description)
                .padding()
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
