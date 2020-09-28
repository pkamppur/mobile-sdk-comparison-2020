//
//  BGGApi.swift
//  TheHotnessSwiftUI
//
//  Created by Petteri Kamppuri on 28.9.2020.
//

import Foundation
import Combine

class BGGApi: ObservableObject {
    private let baseURL = URL(string: "http://localhost:38651/api")!
    
    func theHotness() -> AnyPublisher<[Game], Never> {
        let url = baseURL.appendingPathComponent("/the-hotness")

        return URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap { try JSONDecoder().decode(HotListResponse.self, from: $0.data) }
            .map { $0.items }
            .catch { error -> Just<[Game]> in
                print("error \(error)")
                return Just([])
            }
            .receive(on: RunLoop.main)
            .share()
            .eraseToAnyPublisher()
    }

    func gameDetails(for gameId: String) -> AnyPublisher<GameDetails?, Never> {
        let url = baseURL.appendingPathComponent("/games/\(gameId)/details")
        
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap { try JSONDecoder().decode(GameDetails.self, from: $0.data) }
            .map { Optional.some($0) }
            .catch { error -> Just<GameDetails?> in
                print("error \(error)")
                return Just(nil)
            }
            .receive(on: RunLoop.main)
            .share()
            .eraseToAnyPublisher()
    }
}

private struct HotListResponse: Decodable {
    let items: [Game]
}
