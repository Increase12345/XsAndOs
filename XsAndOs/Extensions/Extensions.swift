//
//  Extensions.swift
//  XsAndOs
//
//  Created by Nick Pavlov on 6/3/23.
//

import SwiftUI

struct PlayerButtonStyle: ButtonStyle {
    let isCurrent: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(8)
            .background(RoundedRectangle(cornerRadius: 10)
                .fill(isCurrent ? Color.green: .gray)
            )
            .foregroundColor(.white)
    }
}
