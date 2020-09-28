//
//  GameInfoView.swift
//  TheHotnessSwiftUI
//
//  Created by Petteri Kamppuri on 29.9.2020.
//

import SwiftUI

struct GameInfoView: View {
    let details: GameDetails
    
    private let topInfoBoxBackgroundColor = Color(UIColor(white: 0.905, alpha: 1))
    private let dividerColor = Color(UIColor(white: 0.776, alpha: 1))

    var body: some View {
        Group {
            VStack(spacing: 0) {
                HStack(alignment: .top, spacing: 0) {
                    VStack {
                        Text("\(details.playersMin)–\(details.playersMax) Players")
                            .bold()
                            .font(.body)
                        Text("Best: \(details.playersBest)")
                            .font(.caption)
                    }
                    .padding([ .top, .bottom], 10)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    
                    Rectangle().fill(dividerColor).frame(width: 1)
                    
                    VStack {
                        Text("\(details.playingTimeMin)–\(details.playingTimeMax) Min")
                            .bold()
                            .font(.body)
                        Text("Playing Time")
                            .font(.caption)
                    }
                    .padding([ .top, .bottom], 10)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    
                }
                .fixedSize(horizontal: false, vertical: true)
                .frame(minWidth: 0, maxWidth: .infinity)
                
                Rectangle().fill(dividerColor).frame(height: 1).frame(maxWidth: .infinity)
                    .padding([ .leading, .trailing ])
            }
            
            VStack(spacing: 5) {
                Group {
                    HStack(alignment: .top, spacing: 0) {
                        Text("Designer: ")
                            .bold()
                        Text(details.designers.map { $0.name }.joined(separator: ", "))
                    }
                    
                    HStack(alignment: .top, spacing: 0) {
                        Text("Artist: ")
                            .bold()
                        Text(details.artists.map { $0.name }.joined(separator: ", "))
                    }
                    
                    HStack(alignment: .top, spacing: 0) {
                        Text("Publisher: ")
                            .bold()
                        Text((details.publishers.first?.name ?? "") + " + \(details.publishers.count - 1) more")
                    }
                }
                .font(.callout)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
        }
        .background(topInfoBoxBackgroundColor)
    }
}
