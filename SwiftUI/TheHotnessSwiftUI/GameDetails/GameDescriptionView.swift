//
//  GameDescriptionView.swift
//  TheHotnessSwiftUI
//
//  Created by Petteri Kamppuri on 29.9.2020.
//

import SwiftUI

struct GameDescriptionView: View {
    let details: GameDetails
    
    let categoryBoxBackgroundColor = Color(UIColor(white: 0.968, alpha: 1))
    let categoryRowSpacing: CGFloat = 3

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Description")
                .bold()
                .font(Font.title3)
            
            Divider()
            
            VStack(alignment: .leading, spacing: 10) {
                VStack(alignment: .leading, spacing: categoryRowSpacing) {
                    Text("Category")
                        .bold()
                    ForEach(details.categories) {
                        Text($0.name)
                    }
                }
                
                VStack(alignment: .leading, spacing: categoryRowSpacing) {
                    Text("Mechanisms")
                        .bold()
                    ForEach(details.mechanisms) {
                        Text($0.name)
                    }
                }
                
                if details.expansions.count > 0 {
                    VStack(alignment: .leading, spacing: categoryRowSpacing) {
                        Text("Expansions")
                            .bold()
                        ForEach(details.expansions) {
                            Text($0.name)
                        }
                    }
                }
                
                VStack(alignment: .leading, spacing: categoryRowSpacing) {
                    Text("Family")
                        .bold()
                    ForEach(details.families) {
                        Text($0.name)
                    }
                }
            }
            .font(.callout)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(10)
            .background(categoryBoxBackgroundColor)
            
            Text(details.description)
                .font(.callout)
                .padding(.top)
        }
        .padding()
        .background(Color.white)
    }
}
