//
//  SpotifyCategoryCell.swift
//  SwiiftUISpotify
//
//  Created by Miad Jalili on 2024-04-10.
//

import SwiftUI

struct SpotifyCategoryCell: View {
    var title:String = "Music"
    var isSelected: Bool = false
    var body: some View {
        Text(title)
            .font(.callout)
            .frame(minWidth: 35)
            .padding(.vertical, 8)
            .padding(.horizontal, 10)
            .background(isSelected ? .spotifyGreen : .spotifyDarkGray)
            .foregroundStyle(isSelected ? .spotifyBlack : .spotifyWhite)
            .cornerRadius(16)
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        SpotifyCategoryCell()
    }
  
}
