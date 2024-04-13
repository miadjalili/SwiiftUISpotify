//
//  SpotifyNewReleaseCell.swift
//  SwiiftUISpotify
//
//  Created by Miad Jalili on 2024-04-12.
//

import SwiftUI

struct SpotifyNewReleaseCell: View {
   
    var  imageName: String = Constants.randomImage
    var  headline: String? = "New release from"
    var  subheadline: String? = "Some Artist"
    var  title: String? = "Some Playlist"
    var  subtitle: String? = "Single - title"
    var body: some View {
        VStack(spacing: 16, content: {
            HStack(spacing: 8,content: {
                ImageLoderView(urlString: imageName)
                    .frame(width: 50, height: 50)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                VStack(alignment:.leading, spacing: 2, content: {
                    if let headline {
                        Text(headline)
                            .foregroundStyle(.spotifyGray)
                            .font(.callout)
                    }
                    if let subheadline {
                        Text(subheadline)
                            .foregroundStyle(.spotifyWhite)
                            .font(.title2)
                            .fontWeight(.medium)
                    }
                })
            })
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                
        })
    }
        
}

#Preview {
        SpotifyNewReleaseCell()
}
