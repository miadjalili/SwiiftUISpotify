//
//  SpotifyRecentsCell.swift
//  SwiiftUISpotify
//
//  Created by Miad Jalili on 2024-04-12.
//

import SwiftUI

struct SpotifyRecentsCell: View {
    var imageName: String = Constants.randomImage
    var title:String = "Some random Tiltle"
    
    var body: some View {
        HStack(spacing: 16){
           ImageLoderView(urlString: imageName)
                .frame(width: 55, height: 55)
            Text(title)
                .font(.callout)
                .fontWeight(.semibold)
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
        }
        .padding(.trailing, 8)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
        .themeColors(isSelected: false)
        
        .cornerRadius(6)
    }
}

#Preview {
    SpotifyRecentsCell()
}
