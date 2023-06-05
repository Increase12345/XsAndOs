//
//  GameSquare.swift
//  XsAndOs
//
//  Created by Nick Pavlov on 6/3/23.
//

import SwiftUI

struct GameSquare {
    var id: Int
    var player: Player?
    
    var image: Image {
        if let plaayer = player {
            return plaayer.gamePiece.image
        } else {
            return Image("none")
        }
    }
    
    static var reset: [GameSquare] {
        var squares = [GameSquare]()
        for index in 1...9 {
            squares.append(GameSquare(id: index))
        }
        return squares
    }
}
