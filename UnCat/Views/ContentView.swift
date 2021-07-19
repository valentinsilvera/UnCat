//
//  ContentView.swift
//  UnCat
//
//  Created by Valentin Silvera on 18.07.21.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var remoteImageController = RemoteImageController.shared
    
    var body: some View {
        NavigationView{
            List{
                ForEach(remoteImageController.results, content: { result in
                    NetworkImage(url: URL(string: result.urls.regular))
                })
            }
            .onAppear() {
                remoteImageController.getImages()
            }
            .navigationTitle("UnCat")
        }
        .listStyle(.plain)
    }
}
