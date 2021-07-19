//
//  RemoteImageController.swift
//  RemoteImageController
//
//  Created by Valentin Silvera on 18.07.21.
//

import Foundation
import SwiftUI

class RemoteImageController : ObservableObject {
    static let shared = RemoteImageController()
    private init() {}
    
    var token = "uhXzEth52VlZhWzTeWatWYXGiQyr1qSF5FtglVJcdgs"
    @Published var results = [Result]()
    
    func getImages() {
        let url = URL(string: "https://api.unsplash.com/search/photos?query=cat")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.setValue("Client-ID \(token)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            do {
                let res = try JSONDecoder().decode(Results.self, from: data)
                self.results.append(contentsOf: res.results)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
