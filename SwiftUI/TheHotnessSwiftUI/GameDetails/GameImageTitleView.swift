//
//  GameImageTitleView.swift
//  TheHotnessSwiftUI
//
//  Created by Petteri Kamppuri on 29.9.2020.
//

import SwiftUI

struct GameImageTitleView: View {
    let details: GameDetails
    
    var body: some View {
        VStack(spacing: 0) {
            URLImageView(url: details.imageUrl)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: 300)
                .fixedSize(horizontal: false, vertical: true)
            VStack {
                HStack(alignment: .firstTextBaseline) {
                    Text(details.name)
                        .foregroundColor(.white)
                    Text(details.yearPublished)
                        .foregroundColor(.gray)
                }
                .font(Font.title3.bold())
            }
            .padding(.all)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(Color.black)
    }
}
