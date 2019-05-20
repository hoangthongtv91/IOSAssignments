//
//  SearchResultsContainerViewController.swift
//  AppStore
//
//  Created by Thong Hoang Nguyen on 2019-05-08.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import UIKit

class SearchResultsContainerViewController: UIViewController {
    
    private var suggestionViewController: SearchSuggestionTableViewController!
    var previousViewController: UIViewController?
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        suggestionViewController = SearchSuggestionTableViewController()
    }
}

extension SearchResultsContainerViewController {
    
}
