//
//  ViewController.swift
//  ColorPicker
//
//  Created by Thong Hoang Nguyen on 2019-04-15.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var colorView: UIView!
    @IBOutlet var redSwitch: UISwitch!
    @IBOutlet var greenSwitch: UISwitch!
    @IBOutlet var blueSwitch: UISwitch!
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.borderWidth = 5.0
        colorView.layer.cornerRadius = 20
        colorView.layer.borderColor = UIColor.black.cgColor
        
        let defaults = UserDefaults.standard
        
        redSwitch.isOn = defaults.bool(forKey: "redSwitchIsOn")
        greenSwitch.isOn = defaults.bool(forKey: "greenSwitchIsOn")
        blueSwitch.isOn = defaults.bool(forKey: "blueSwitchIsOn")
        redSlider.setValue(defaults.float(forKey: "redSliderValue"), animated: true)
        greenSlider.setValue(defaults.float(forKey: "greenSliderValue"), animated: true)
        blueSlider.setValue(defaults.float(forKey: "blueSliderValue"), animated: true)
        
        updateColor()
        updateControls()
    }
    
    fileprivate func updateColor() {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        let defaults = UserDefaults.standard
        defaults.set(false, forKey: "redSwitchIsOn")
        defaults.set(false, forKey: "blueSwitchIsOn")
        defaults.set(false, forKey: "greenSwitchIsOn")
        
        if redSwitch.isOn {
            defaults.set(true, forKey: "redSwitchIsOn")
            red = CGFloat(redSlider.value)
            defaults.set(red, forKey: "redSliderValue")
        }
        if greenSwitch.isOn {
            defaults.set(true, forKey: "greenSwitchIsOn")
            green = CGFloat(greenSlider.value)
            defaults.set(green, forKey: "greenSliderValue")
        }
        if blueSwitch.isOn {
            defaults.set(true, forKey: "blueSwitchIsOn")
            blue = CGFloat(blueSlider.value)
            defaults.set(blue, forKey: "blueSliderValue")
        }
        let bgColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        view.backgroundColor = bgColor
        colorView.backgroundColor = bgColor
    }
    
    fileprivate func updateControls() {
        redSlider.isEnabled = redSwitch.isOn
        greenSlider.isEnabled = greenSwitch.isOn
        blueSlider.isEnabled = blueSwitch.isOn
    }
    @IBAction func switchChanged(_ sender: UISwitch) {
        updateColor()
        updateControls()
    }
    @IBAction func sliderChange(_ sender: UISlider) {
        updateColor()
        
    }
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        redSlider.value = 0
        greenSlider.value = 0
        blueSlider.value = 0
        
        redSwitch.isOn = false
        greenSwitch.isOn = false
        blueSwitch.isOn = false
        
        updateControls()
        updateColor()
    }
    
    
}
