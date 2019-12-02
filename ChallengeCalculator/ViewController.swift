//
//  ViewController.swift
//  ChallengeCalculator
//
//  Created by Eric Davenport on 12/2/19.
//  Copyright © 2019 Eric Davenport. All rights reserved.
//

import UIKit

enum ChallengeType: Int {
    case elevation // 0
    case distance // 1
}

class ViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var metricTextField: UITextField!
    @IBOutlet weak var numberOfWeeksTextField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    
    var currentChallenge: ChallengeType = ChallengeType.elevation{
        didSet {
            calculateChallenge()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateChallengePressed(_ sender: UIButton) {
        calculateChallenge()
    }
    
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        
        currentChallenge = ChallengeType(rawValue: sender.selectedSegmentIndex) ?? ChallengeType.elevation
    }
    
    
    
    func calculateChallenge() {
        // get the metric and number of days from the textFields
        guard let metric = Double(metricTextField.text ?? ""),
            let numberOfWeeks = Int(numberOfWeeksTextField.text ?? "") else {
                // TODO: best to present an alert controller to the user
                messageLabel.text = "Missing required field"
                return
        }
        let challenge = Challenge()
        
        let weeklyTraining = challenge.calculateWeeklyTraining(for: metric, and: numberOfWeeks)
        
        // switch on current selected segment in out degmentyed control
        switch currentChallenge {
        case .elevation:
            messageLabel.text = "Weekly training: \(weeklyTraining) feet"
        case .distance:
            messageLabel.text = "weekly Training \(weeklyTraining) miles"
        }
    }
    
}

