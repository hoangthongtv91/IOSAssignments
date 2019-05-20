//
//  TodayCollectionCollectionViewController.swift
//  AppStore
//
//  Created by Thong Hoang Nguyen on 2019-05-10.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class TodayCollectionCollectionViewController: UICollectionViewController{
    let cellID = "collectionView cell"
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.collectionView.delegate = self
        self.collectionView.register(UICollectionViewCell(), forCellWithReuseIdentifier: cellID)
    }
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
