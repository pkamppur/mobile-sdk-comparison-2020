//
//  GameRow.swift
//  TheHotnessSwiftUI
//
//  Created by Petteri Kamppuri on 28.9.2020.
//

import SwiftUI

struct GameRow: View {
    let game: Game
    
    var body: some View {
        HStack {
            RoundedThumbnail(url: game.thumbnailUrl)
            VStack(alignment: .leading) {
                Text(game.name)
                Text(game.yearPublished)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding(.trailing)
        }
    }
}
