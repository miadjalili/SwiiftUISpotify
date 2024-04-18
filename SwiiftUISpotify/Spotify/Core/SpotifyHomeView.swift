//
//  SpotifyHomeView.swift
//  SwiiftUISpotify
//
//  Created by Miad Jalili on 2024-04-10.
//

import SwiftUI
import SwiftfulUI

struct SpotifyHomeView: View {
    
    @State private var currentUser: User? = nil
    @State private var selectedCategory: Category? = nil
    @State private var products: [Product] = []
    var body: some View {
        ZStack{
            Color.spotifyBlack
                .ignoresSafeArea()
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 1, pinnedViews: .sectionHeaders) {
                    Section {
                        VStack(spacing:16) {
                            recentSection
                            if let product = products.first {
                                
                                newReleaseSection(product: product)
                            }
                        }
                        .padding(.horizontal,16)
                    } header: {
                        header
                    }
                }
                
            }
            .scrollIndicators(.hidden)
            .clipped()
            
        }
        
        .task {
            await getData()
        }
        .toolbar(.hidden,for: .navigationBar)
    }
}

extension SpotifyHomeView {
    
    private func getData() async {
        do
        {
            currentUser = try await DatabaseHelper().getUsers().first
            products = try await Array(DatabaseHelper().getProducts().prefix(8))
        } catch {
            //
        }
    }
    
    private var header: some View {
        
        HStack {
            ZStack
            {
                if let currentUser {
                    ImageLoderView(urlString: currentUser.image)
                        .background(.spotifyWhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            //
                        }
                }
            }
            .frame(width: 35,height: 30)
         
            ScrollView(.horizontal) {
                HStack(spacing: 8, content: {
                    ForEach(Category.allCases, id: \.self) { Category in
                        SpotifyCategoryCell(title: Category.rawValue.capitalized,isSelected: Category == selectedCategory)
                        
                            .onTapGesture {
                                selectedCategory = Category
                            }
                    }
                   
                })
            }
            .scrollIndicators(.hidden)
            .clipped()
        }
        .padding(.vertical,24)
        .padding(.leading,8)
        .frame(maxWidth: .infinity)
        .background(.spotifyBlack)
    }
    
    
    
    private var recentSection: some View {
        
        NonLazyVGrid(columns: 2, alignment: .center, spacing: 10, items: products) { product in
            if let product {
                SpotifyRecentsCell(imageName: product.firstImage, title: product.title)
            }
        }
    }
    
    private func newReleaseSection(product: Product) -> some View {
        
        SpotifyNewReleaseCell(
            imageName: product.firstImage,
            headline: product.brand,
            subheadline: product.category,
            title: product.title,
            subtitle: product.description,
            onAddToPlaylistPressed: nil,
            
            onPlayPressed: nil
        )
        
        
    }
    
    
}

#Preview {
    SpotifyHomeView()
}
