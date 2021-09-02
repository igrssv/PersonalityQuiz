//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Игорь Сысоев on 31.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var descriptionResultLabel: UILabel!
    
    var answerChoes: [Answer] = []

    private var dog = 0
    private var cat = 0
    private var rabbit = 0
    private var turtle = 0

//    Здесь можно было бы поиграться с DitSet возможно, но дедлайн горит
    private var animalListAnswer: [Animal: Int] = [.dog: 0, .cat: 0, .rabbit: 0, .turtle: 0]
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        ScoreAnimalAnswer()

    }
     
    fileprivate func ScoreAnimalAnswer() {
        for i in answerChoes {
            
            switch i.animal {
            case .dog:
                dog += 1
                animalListAnswer[.dog] = dog
            case .cat:
                cat += 1
                animalListAnswer[.cat] = cat
            case .rabbit:
                rabbit += 1
                animalListAnswer[.rabbit] = rabbit
            case .turtle:
                turtle += 1
                animalListAnswer[.turtle] = turtle
            }
            
        }
        
        let animalMax = animalListAnswer.max (by: { a, b in a.value < b.value })
        resultLabel.text = "Вы - \(animalMax?.key.rawValue ?? " ")"
        descriptionResultLabel.text = "\(animalMax?.key.definition ?? " ")"
        
    }
    
    }
    
    

