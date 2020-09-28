//
//  GameDetailsView.swiftV
//  SwiftBoard
//
//  Created by Petteri Kamppuri on 28.9.2020.
//

import SwiftUI
import Combine

struct GameDetailsView: View {
    let source: AnyPublisher<GameDetails?, Never>
    @State private var gameDetails: GameDetails? = nil
    
    var body: some View {
        Group {
            if gameDetails == nil {
                ProgressView()
                    .onReceive(source) { details in
                        gameDetails = details
                    }
            } else {
                LoadedGameDetailsView(details: gameDetails!)
            }
        }
    }
}

private struct LoadedGameDetailsView: View {
    let details: GameDetails
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                GameImageTitleView(details: details)
                GameInfoView(details: details)
                GameDescriptionView(details: details)
            }
        }
    }
}
