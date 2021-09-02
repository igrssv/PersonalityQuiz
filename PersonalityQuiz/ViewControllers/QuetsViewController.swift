//
//  QuetsViewController.swift
//  PersonalityQuiz
//
//  Created by Игорь Сысоев on 31.08.2021.
//

import UIKit

class QuetsViewController: UIViewController {
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet weak var myltipleStackView: UIStackView!
    @IBOutlet var myltipleLabels: [UILabel]!
    @IBOutlet var myltipleSwitches: [UISwitch]!
    
    
    @IBOutlet weak var rangedStacView: UIStackView!
    @IBOutlet var rangedLables: [UILabel]!
    @IBOutlet weak var rangedSlider: UISlider! {
        didSet {
            let ansverCount = Float(currentAnswet.count - 1)
            rangedSlider.maximumValue = ansverCount
            rangedSlider.value = ansverCount / 2
        }
    }
    
    private let quest = Question.getQuestions()
    private var answerChoes: [Answer] = []
    private var currentAnswet: [Answer] {
        quest[questionsIndex].answer
    }
    
    private var questionsIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultVS = segue.destination as? ResultViewController else { return }
        resultVS.answerChoes = answerChoes
    }

    // MARK: - IBAction
    @IBAction func singleButtonAnswerPress(_ sender: UIButton) {
        guard let setButton = singleButtons.firstIndex(of: sender) else { return }
        answerChoes.append(currentAnswet[setButton])
        nextQuessions()
    }
    
    @IBAction func myltipleButtonAnswerPress() {
        for (myltiperSwitch, answer) in zip(myltipleSwitches, currentAnswet){
            if myltiperSwitch.isOn {
                answerChoes.append(answer)
            }
        }
        nextQuessions()
    }
    
    @IBAction func rangeButtonAnswerPress() {
        let index = lrintf(rangedSlider.value)
        answerChoes.append(currentAnswet[index])
        nextQuessions()
    }
    
    
}

// MARK: - Privite func
extension QuetsViewController {
    
    private func updateUI() {
        for stackView in [singleStackView, myltipleStackView, rangedStacView] {
            stackView?.isHidden = true
        }
        
        title = "Вопрос № \(questionsIndex + 1) из \(quest.count)"
        
        let totalProgress = Float(questionsIndex) / Float(quest.count)
        questionProgressView.setProgress(totalProgress, animated: true)
        
        questionLabel.text = quest[questionsIndex].titel
        
        showCurrentAnswer(for: quest[questionsIndex].type)

    }
    // MARK: - Current Answer
    private func showCurrentAnswer(for type: ResponseType) {
        switch type {
        case .single:
            return showSingleStackView(witch: currentAnswet)
        case .multiple:
            return showMyltiStackView(witch: currentAnswet)
        case .range:
            return showRangeStackView(witch: currentAnswet)
        }
        
    }
    
    // MARK: - Show StackView
    private func showSingleStackView(witch answers: [Answer]) {
        singleStackView.isHidden.toggle()
   
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.titel, for: .normal)
        }
        
    }
    
    private func showMyltiStackView(witch answers: [Answer]) {
        myltipleStackView.isHidden.toggle()
        
        for (lable, answer) in zip(myltipleLabels, answers) {
            lable.text = answer.titel
        }
    }
    
    private func showRangeStackView(witch answers: [Answer]) {
        rangedStacView.isHidden.toggle()
        
        rangedLables.first?.text = answers.first?.titel
        rangedLables.last?.text = answers.last?.titel
    }
    
    
    private func nextQuessions() {
        questionsIndex += 1
        
        if questionsIndex < quest.count {
            updateUI()
            return
        }
        
        performSegue(withIdentifier: "showResult", sender: nil)
        
    }
        
  


    
}

