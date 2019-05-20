//
//  SearchViewController.swift
//  AppStore
//
//  Created by Thong Hoang Nguyen on 2019-04-25.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import UIKit
import SDWebImage

enum SearchState {
    case trending
    case suggestion
    case final
}
//trending page
class SearchViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    //MARK: - Properties
    private var searchResult = [ResultApp]()
    fileprivate var searchController = UISearchController()
    private var searchState: SearchState = .trending
    var timer: Timer?
    
    //MARK: - Constants
    private let cellID = "trendingCell"
    private let trendings = ["Instagram", "Facebook", "Tinder", "Snapchat", "Google"]
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        searchController = UISearchController(searchResultsController: SearchResultsContainerViewController())
        collectionView.backgroundColor = .white
        setupSearchBar()
    }
    fileprivate func setupSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            NetworkService.shared.fetchSearchResultApps(searchTerm: searchText) { (result, error) in
                self.searchResult = result
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        })
        
    }
    
    //MARK: UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 340 )
    }
    //MARK: DATASOURCE
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.searchResult.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SearchCollectionViewCell
        cell.resultApp = searchResult[indexPath.item]
        return cell
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
}
