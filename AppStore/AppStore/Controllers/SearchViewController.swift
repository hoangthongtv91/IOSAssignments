//
//  SearchViewController.swift
//  AppStore
//
//  Created by Thong Hoang Nguyen on 2019-04-25.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import UIKit

class SearchViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellID = "resultCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.backgroundColor = .white
        fetchSearchResultApps()
    }
    
    //MARK: UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 340 )
    }
    //MARK: DATASOURCE
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SearchCollectionViewCell
        cell.contentView.backgroundColor = .white
        
        return cell
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func fetchSearchResultApps() {
        // 1. url
        let urlString = "https://itunes.apple.com/search?term=facebook&entity=software"
        // 2. send a request
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let err = error {
                print("Failed to fetch apps:", err)
                return
            }
            guard let data = data else { return }
            do {
                // 3. parse response
                let searchResult = try JSONDecoder().decode(SearchResultApp.self, from: data)
                searchResult.results.forEach({ (result) in
                    print(result.trackName, result.primaryGenreName)
                })
            } catch {
                print("Failed to decode JSON:", error)
            }
            
        }.resume()
        
    }
}
