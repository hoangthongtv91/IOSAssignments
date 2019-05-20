//
//  SecondViewController.swift
//  LifeCycle
//
//  Created by Thong Hoang Nguyen on 2019-05-09.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // WHen the view controller loads the view into the memory
        // (note yet visible)
        // This process creates the view that the controller will manage
        // Gets called once when the views are loaded to the memory
        // 1. Intitialization of views (set attributes of views)
        // 2. Network requests
        // 3. Database access
        print("SecondViewController - View did load")
    }
    
    //For work that will be performed multiple times, your app
    //can rely on these view event notification (life cycle methods)
    //When the visibility of its views changes, a view controller will
    //automatically call its life cycle methods
    
    
    // This method gets called right before the view is displays (everytime),
    // 1. Updating user location
    // 2. Updating or refreshing some views (everytime)
    // 3. Starting network requests.
    // 4. Adjust screen orientation. (portrait, landscape)
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SecondViewController - view will appear")
    }
    
    // Gets called right after the view appears on the screen
    // 1. Start an animation
    // 2. long running code (fetching database access)
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("SecondViewController - view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("SecondViewController - view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("SecondViewController - view did disappear")
    }
}
