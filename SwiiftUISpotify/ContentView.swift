//
//  ContentView.swift
//  SwiiftUISpotify
//
//  Created by Miad Jalili on 2024-04-09.
//

import SwiftUI

struct ContentView: View {
    
    @State private var users:[User] = []
    @State private var products: [Product] = []
    var body: some View {
        ScrollView{
            VStack
            {
                ForEach(products) { product in
                    Text(product.title)
    
                }
            }
        }
        .padding()
        .task {
            await getData()
        }
    }
    private func getData() async {
        do
        {
            users = try await DatabaseHelper().getUsers()
            products = try await DatabaseHelper().getProducts()
        }catch{
            
        }
    }
}

#Preview {
    ContentView()
}
