//
//  GameView.swift
//  XsAndOs
//
//  Created by Nick Pavlov on 6/3/23.
//

import SwiftUI

struct GameView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("End Game") {
                    dismiss()
                }
                .buttonStyle(.bordered)
            }
        }
        .navigationTitle("Xs And Os")
        .inNavigationStack()
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
