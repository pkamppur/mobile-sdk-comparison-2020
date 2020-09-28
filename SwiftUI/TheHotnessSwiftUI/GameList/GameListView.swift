//
//  GameListView.swift
//  TheHotnessSwiftUI
//
//  Created by Petteri Kamppuri on 28.9.2020.
//

import SwiftUI
import Combine

struct GameListView: View {
    var theHotness: AnyPublisher<[Game], Never>
    @State private var games: [Game]? = nil
    
    var body: some View {
        GameList(title: "The Hotness", games: games)
            .onReceive(theHotness) { theHotness in
                games = theHotness
            }
    }
}

private struct GameList: View {
    let title: String
    let games: [Game]?
    
    var body: some View {
        NavigationView {
            Group {
                if let games = games {
                    LoadedGameList(games: games)
                } else {
                    ProgressView()
                }
            }
            .navigationBarTitle(LocalizedStringKey(title))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

private struct LoadedGameList: View {
    let games: [Game]
    @EnvironmentObject var bggApi: BGGApi

    var body: some View {
        List {
            ForEach(games, id: \.name) { game in
                NavigationLink(
                    destination: GameDetailsView(source:
                        bggApi.gameDetails(for: game.id)
                    )
                        .navigationBarTitle(Text(game.name), displayMode: .inline)
                ) {
                    GameRow(game: game)
                }
            }
        }
    }
}

struct GameListContainer_Previews: PreviewProvider {
    static var previews: some View {
        GameListPreviewContainer()
    }
}

struct GameListPreviewContainer: View {
    @StateObject private var bggApi = BGGApi()

    var body: some View {
        GameListView(theHotness: bggApi.theHotness())
            .environmentObject(bggApi)
    }
}
