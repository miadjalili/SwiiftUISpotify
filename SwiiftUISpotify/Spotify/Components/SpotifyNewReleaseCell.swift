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
    var onAddToPlaylistPressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
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
                
            HStack{
               
                ImageLoderView(urlString: imageName)
                    .frame(width: 140, height: 140)
                
                VStack(alignment: .leading,spacing: 32)
                {
                    
                    VStack(alignment: .leading,spacing: 2)
                    {
                        if let title {
                            Text(title)
                                .fontWeight(.semibold)
                                .foregroundStyle(.spotifyWhite)
                        }
                        if let subtitle {
                            Text(subtitle)
                               
                                .foregroundStyle(.spotifyLightGray)
                        }
                        
                    }
                    .font(.callout)
                    HStack{
                      Image(systemName: "plus.circle")
                            .foregroundColor(.spotifyLightGray)
                            .font(.title3)
                            .padding(4)
                            .background(Color.black.opacity(0.001))
                            .onTapGesture {
                                onAddToPlaylistPressed?()
                                
                            }
                            .offset(x: -4)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                        Image(systemName: "play.circle.fill")
                              .foregroundColor(.spotifyWhite)
                              .font(.title)
                          
                    }
                }
                .padding(.trailing, 16)
            }
            .themeColors(isSelected: false)
            .cornerRadius(8)
            
            .onTapGesture {
                onPlayPressed?()
            }
        })
    }
        
}

#Preview {
    ZStack
    {
        Color.spotifyBlack.ignoresSafeArea()
        SpotifyNewReleaseCell()
            .padding()
}
    }
       
