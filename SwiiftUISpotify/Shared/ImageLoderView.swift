//
//  ImageLoderView.swift
//  SwiiftUISpotify
//
//  Created by Miad Jalili on 2024-04-09.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoderView: View {
    let urlString: String = Consants.randomImage
    let reszingMode: ContentMode = .fill

    var body: some View {
        Rectangle()
            .opacity(0.001)
            .overlay {
                WebImage(url: URL(string: urlString ))
                    .resizable()
                    .indicator(.activity )
                    .aspectRatio(contentMode: .fill)
                    .allowsHitTesting(false)
            }
            .clipped()
        
       
    }
}

#Preview {
    ImageLoderView()
        .cornerRadius(30)
        .padding(40)
        .padding(.vertical, 60)
}
