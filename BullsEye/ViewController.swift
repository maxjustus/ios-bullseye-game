//
//  ViewController.swift
//  BullsEye
//
//  Created by Max Spransy on 11/9/18.
//  Copyright © 2018 Max Spransy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue = 0
    var targetValue = 0
    var round = 0
    var score = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetValueLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }
    
    @IBAction func showAlert() {
        let roundScore = calculateRoundScore()
        score += roundScore
        
        let alert = UIAlertController(title: scoreTitle(roundScore),
            message: "You scored \(roundScore) points",
            preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    func scoreTitle(_ roundScore: Int) -> String {
        let title: String
        
        if roundScore == 200 {
            title = "Perfect!"
        } else if roundScore > 95 {
            title = "You almost had it!"
        } else if roundScore > 90 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
        return title;
    }
    
    func calculateRoundScore() -> Int {
        let valueDifference = abs(currentValue - targetValue)
        if (valueDifference == 0) {
            return 200
        } else if valueDifference == 1 {
            return 149
        } else {
            return 100 - valueDifference
        }
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        round += 1
        currentValue = 50
        updateLabels()
    }
    
    func updateLabels() {
        targetValueLabel.text = String(targetValue)
        roundLabel.text = String(round)
        slider.value = Float(currentValue)
        scoreLabel.text = String(score)
    }

}

