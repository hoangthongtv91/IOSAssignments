//
//  ViewController.swift
//  MemeMaker
//
//  Created by Thong Hoang Nguyen on 2019-04-23.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var topCaptionSegmentedControl: UISegmentedControl!
    @IBOutlet var bottomCaptionSegmentedControl: UISegmentedControl!
    @IBOutlet var topCaptionLabel: UILabel!
    @IBOutlet var bottomCaptionLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    @IBAction func segmentedControllPicker(_ sender: UISegmentedControl) {
        updateLabel()
    }
    
    var choice1 = CaptionOption(caption: "You know what's cool?", emoji: "🕶")
    var choice2 = CaptionOption(caption: "You know what makes me mad?", emoji: "💥")
    var choice3 = CaptionOption(caption: "You know what I love?", emoji: "💕")
    var choice4 = CaptionOption(caption: "Cats wearing hats", emoji: "🐱")
    var choice5 = CaptionOption(caption: "Dogs carrying logs", emoji: "🐕")
    var choice6 = CaptionOption(caption: "Monkeys being funky", emoji: "🐒")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let topChoices = [choice1, choice2, choice3]
        let bottomChoices = [choice4, choice5, choice6]
        topCaptionSegmentedControl.removeAllSegments()
        bottomCaptionSegmentedControl.removeAllSegments()
        for choice in topChoices {
            topCaptionSegmentedControl.insertSegment(withTitle: choice.emoji, at: topChoices.count, animated: false)
        }
        for choice in bottomChoices {
            bottomCaptionSegmentedControl.insertSegment(withTitle: choice.emoji, at: bottomChoices.count, animated: false)
        }
        topCaptionSegmentedControl.selectedSegmentIndex = 0
        bottomCaptionSegmentedControl.selectedSegmentIndex = 0
        updateLabel()
        
    }
    
    fileprivate func updateLabel() {
        let topChoices = [choice1, choice2, choice3]
        let bottomChoices = [choice4, choice5, choice6]
        topCaptionLabel.text = topChoices[topCaptionSegmentedControl.selectedSegmentIndex].getCaption
        bottomCaptionLabel.text = bottomChoices[bottomCaptionSegmentedControl.selectedSegmentIndex].getCaption
        let bottomIndex = bottomCaptionSegmentedControl.selectedSegmentIndex
        switch bottomIndex {
        case 0:
            imageView.image = UIImage(named: "cat_wearing_a_hat")
        case 1:
            imageView.image = UIImage(named: "dog_carrying_logs")
        default:
            imageView.image = UIImage(named: "monkey_being_funky")
        }
    }

}

