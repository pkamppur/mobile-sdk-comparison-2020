//
//  RoundedThumbnail.swift
//  SwiftBoard
//
//  Created by Petteri Kamppuri on 28.9.2020.
//

import SwiftUI

struct RoundedThumbnail: View {
    let url: URL
    
    var body: some View {
        URLImageView(url: url)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 80, height: 80, alignment: .top)
            .cornerRadius(5)
            .clipped()
    }
}
