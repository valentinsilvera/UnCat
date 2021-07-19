//
//  ContentView.swift
//  UnCat
//
//  Created by Valentin Silvera on 18.07.21.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var randomPhoto = Photos()
    
    var body: some View {
        NavigationView{
            List{
                ForEach(randomPhoto.photos, content: { result in
                    NetworkImage(url: URL(string: result.urls.regular))
                        .listRowSeparator(.hidden)
                })
            }
            .navigationTitle("UnCat")
        }
        .listStyle(.plain)
    }
}
