//
//  ViewController.swift
//  SwiftyWords
//

import UIKit

class ViewController: UIViewController {
    let gameView = GameView()
    var buttonsView = ButtonsView()
    
    var letterButtons = [LetterButton]()
    
    var totalCorrectAnswer = 0
    var totalNumberOfLines = 0 {
        didSet {
            totalCorrectAnswer = 0
        }
    }
    
    var activatedButtons = [UIButton]()
    var solutions = [String]()
    
    var level = 1
    var score = 0 {
        didSet {
            gameView.scoreLabel.text = "Score: \(score)"
        }
    }
    
    override func loadView() {
        view = gameView
        gameView.delegate = self
        
        buttonsView = gameView.buttonsView
        buttonsView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        letterButtons = buttonsView.buttons
        
        loadLevel()
    }
    
    func loadLevel() {
        guard let levelFileURL = Bundle.main.url(forResource: "level\(level)", withExtension: "txt") else { return }
        
        guard let levelContents = try? String(contentsOf: levelFileURL) else { return }
        
        var clueString = ""
        var solutionString = ""
        var letterKeys = [String]()
        
        var lines = levelContents.components(separatedBy: "\n")
        lines.shuffle()
        
        totalNumberOfLines = lines.count
        
        for (index, line) in lines.enumerated() {
            let parts = line.components(separatedBy: ": ")
            let answer = parts[0]
            let clue = parts[1]
            
            clueString += "\(index + 1). \(clue)\n"
            
            let solutionWord = answer.replacingOccurrences(of: "|", with: "")
            solutions.append(solutionWord)
            
            solutionString += "\(solutionWord.count) letters \n"
            
            let keys = answer.components(separatedBy: "|")
            letterKeys += keys
        }
        
        gameView.cluesLabel.text = clueString.trimmingCharacters(in: .whitespacesAndNewlines)
        gameView.answersLabel.text = solutionString.trimmingCharacters(in: .whitespacesAndNewlines)
        
        letterKeys.shuffle()
        
        if letterKeys.count == letterButtons.count {
            for i in 0 ..< letterButtons.count {
                letterButtons[i].setTitle(letterKeys[i], for: .normal)
            }
        }
    }
    
    @objc func levelUp(action: UIAlertAction) {
        level += 1
        solutions.removeAll(keepingCapacity: true)
        
        loadLevel()
        
        for button in letterButtons {
            button.isHidden = false
        }
    }
}

extension ViewController: GameViewDelegate, ButtonViewDelegate {
    func didSubmitPressed(_ sender: UIButton) {
        guard let answerText = gameView.currentAnswer.text else { return }
        
        if let solutionPosition = solutions.firstIndex(of: answerText) {
            activatedButtons.removeAll()
            
            var splitAnswers = gameView.answersLabel.text?.components(separatedBy: "\n")
            splitAnswers?[solutionPosition] = answerText
            gameView.answersLabel.text = splitAnswers?.joined(separator: "\n")
            
            gameView.currentAnswer.text = ""
            score += 1
            totalCorrectAnswer += 1
            
            if totalCorrectAnswer == totalNumberOfLines {
                let ac = UIAlertController(title: "Well done!", message: "Are you ready for the next level?", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Let's go!", style: .default, handler: levelUp))
                present(ac, animated: true, completion: nil)
            }
        } else {
            if score > 0 {
                score -= 1
            }
            
            let ac = UIAlertController(title: "Ops!", message: "I have no idea what are your trying to say...", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Try again!", style: .default, handler: nil))
            present(ac, animated: true, completion: nil)
        }
    }
    
    func didClearPressed(_ sender: UIButton) {
        gameView.currentAnswer.text = ""
        
        for button in activatedButtons {
            button.isHidden = false
        }
        
        activatedButtons.removeAll()
    }
    
    func didLetterPressed(_ sender: UIButton) {
        guard let buttonTitle = sender.titleLabel?.text else { return }
        
        gameView.currentAnswer.text = gameView.currentAnswer.text?.appending(buttonTitle) //buttonText? buttonLetterText
        activatedButtons.append(sender)
        sender.isHidden = true
    }
}
