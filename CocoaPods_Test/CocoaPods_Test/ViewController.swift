//
//  ViewController.swift
//  CocoaPods_Test
//
//  Created by Thong Hoang Nguyen on 2019-05-09.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import UIKit
import ScrollableGraphView

class ViewController: UIViewController, ScrollableGraphViewDataSource {
    lazy var graphView = ScrollableGraphView(frame: CGRect(x: 0, y: 0, width: 200, height: 200), dataSource: self)
    let linePlot1 = LinePlot(identifier: "line1")
    let referenceLines = ReferenceLines()
    override func viewDidLoad() {
        super.viewDidLoad()
        graphView.addPlot(plot: linePlot1)
        graphView.addReferenceLines(referenceLines: referenceLines)
        view.addSubview(graphView)
        graphView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            graphView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            graphView.widthAnchor.constraint(equalToConstant: 400),
            graphView.heightAnchor.constraint(equalToConstant: 200),
            graphView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
    
    func value(forPlot plot: Plot, atIndex pointIndex: Int) -> Double {
        switch(plot.identifier) {
        case "line1":
            return 20
        default:
            return 0
        }
    }
    
    func label(atIndex pointIndex: Int) -> String {
        return "FEB \(pointIndex)"
    }
    
    func numberOfPoints() -> Int {
        return 5
    }
}

