//
//  SettingViewController.swift
//  ColorSetting
//
//  Created by Людмила Солопенко on 13.02.2021.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLabelLeft: UILabel!
    @IBOutlet var greenLabelLeft: UILabel!
    @IBOutlet var blueLableLeft: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redLabelRight: UILabel!
    @IBOutlet var greenLabelRight: UILabel!
    @IBOutlet var blueLableRight: UIStackView!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.hidesBackButton = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 15
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        
        setColor()
        setValue(for: redLabelLeft, greenLabelLeft, blueLableLeft)
    }
   
    @IBAction func rgbSlider(_ sender: UISlider) {
        setColor()
        
        switch sender.tag {
        case 0: redLabelLeft.text = string(from: sender)
        case 1: greenLabelLeft.text = string(from: sender)
        case 2: blueLableLeft.text = string(from: sender)
        default: break
        }
    }
    
    @IBAction func doneButtonPressed() {
    }
    
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label.tag {
            case 0: redLabelLeft.text = string(from: redSlider)
            case 1: greenLabelLeft.text = string(from: greenSlider)
            case 2: blueLableLeft.text = string(from: blueSlider)
            default: break
            }
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
