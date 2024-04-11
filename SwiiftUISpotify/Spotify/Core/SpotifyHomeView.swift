//
//  SpotifyHomeView.swift
//  SwiiftUISpotify
//
//  Created by Miad Jalili on 2024-04-10.
//

import SwiftUI

struct SpotifyHomeView: View {
    
    @State private var currentUser: User? = nil
    @State private var selectedCategory: Category? = nil
    var body: some View {
        ZStack{
            Color.spotifyBlack.ignoresSafeArea()
            ScrollView(.vertical) {
                LazyVStack(spacing: 1, pinnedViews: .sectionHeaders, content: {
                    Section {
                        ForEach(1..<10) { _ in
                            Rectangle()
                                .fill(.red)
                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
                        }
                    } header: {
                        header
                    }

                   
                })
                
            }
            .scrollIndicators(.hidden)
            .clipped()
            
        }
       
        .task {
            await getData()
        }
        .toolbar(.hidden,for: .navigationBar)
    }
    
    private func getData() async {
        do
        {
            currentUser = try await DatabaseHelper().getUsers().first
           
        }catch{
            
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
}

#Preview {
    SpotifyHomeView()
}
