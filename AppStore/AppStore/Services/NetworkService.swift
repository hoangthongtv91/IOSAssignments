//
//  NetworkService.swift
//  AppStore
//
//  Created by Thong Hoang Nguyen on 2019-05-06.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

//Singleton object -> 1 instance only
class NetworkService {
    static let shared = NetworkService()
    private init() {}
    func fetchSearchResultApps(searchTerm: String, completion: @escaping ([ResultApp], Error?) -> ()) {
        // 1. url
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        // 2. send a request
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let err = error {
                print("Failed to fetch apps:", err)
                completion([], err)
                return
            }
            guard let data = data else { return }
            do {
                // 3. parse response
                let searchResult = try JSONDecoder().decode(SearchResultApp.self, from: data)
                completion(searchResult.results, nil)
            } catch {
                print("Failed to decode JSON:", error)
                completion([], error)
            }
            
            }.resume()
    }
}
