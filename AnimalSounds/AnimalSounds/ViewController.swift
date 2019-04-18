//
//  ViewController.swift
//  AnimalSounds
//
//  Created by Thong Hoang Nguyen on 2019-04-16.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var animalSoundLabel: UILabel!
    let catSound = SimpleSound(named: "meow")
    let dogSound = SimpleSound(named: "woof")
    let cowSound = SimpleSound(named: "moo")
    @IBAction func catButtonTapped(_ sender: UIButton) {
        animalSoundLabel.text = "Meow!"
        catSound.play()
    }
    @IBAction func dogButtonTapped(_ sender: UIButton) {
        animalSoundLabel.text = "Woof!"
        dogSound.play()
    }
    @IBAction func cowButtonTapped(_ sender: UIButton) {
        animalSoundLabel.text = "Moo!"
        cowSound.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

