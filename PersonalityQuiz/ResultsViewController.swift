//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Mupparapu, Srujan on 2/13/20.
//  Copyright © 2020 Mupparapu, Srujan. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultDefinitionLabel: UILabel!
    
    var responses: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculatePersonalityResult()
    }
    
    func calculatePersonalityResult() {
        var frequencyOfAnswers: [AnimalType: Int] = [:]
        let responseTypes = responses.map { $0.type }
        for response in responseTypes {
           let newCount: Int
        
           if let oldCount = frequencyOfAnswers[response] {
                  newCount = oldCount + 1
           } else {
                  newCount = 1
           }
        
           frequencyOfAnswers[response] = newCount
        }
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key
        
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
    }
    
}
