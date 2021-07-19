//
//  Result.swift
//  Result
//
//  Created by Valentin Silvera on 18.07.21.
//

import Foundation

struct Photo: Codable, Identifiable {
    var id : String
    var username : String?
    var urls: URLs
}

struct URLs : Codable {
    var regular : String
}

class Photos: ObservableObject {
    @Published var photos: [Photo] = []
    
    init() {
        loadData()
    }
    
    func loadData() {
        let key = "uhXzEth52VlZhWzTeWatWYXGiQyr1qSF5FtglVJcdgs"
        let url = "https://api.unsplash.com/photos/random/?count=20&query=cat&client_id=\(key)"
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) { (data, _, error) in
            guard let data = data else {
                print(error ?? "nil")
                return
            }
            do {
                let json = try JSONDecoder().decode([Photo].self, from: data)
                for photo in json {
                    DispatchQueue.main.async {
                        self.photos.append(photo)
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
