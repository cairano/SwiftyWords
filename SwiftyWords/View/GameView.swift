//
//  view.swift
//  SwiftyWords
//

import UIKit

protocol ViewCoding {
    func hierarchyView()
    func constraintView()
    func aditionalConfigView()
    func setup() // build
}

protocol GameViewDelegate: AnyObject {
    func didSubmitPressed(_ sender: UIButton)
    func didClearPressed(_ sender: UIButton)
}

class GameView: UIView {
    weak var delegate: GameViewDelegate?
    
    let scoreLabel = DefaultLabel()
    let cluesLabel = DefaultLabel()
    let answersLabel = DefaultLabel()
    
    let currentAnswer = DefaultTextField()
    
    let submit = DefaultButton(type: .system)
    let clear = DefaultButton(type: .system)
    
    let buttonsView = ButtonsView()
    
    //
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        makeView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //
    
    private func makeView() { // tirar isto
        makeScoreLabel()
        makeClueLabel()
        makeAnswerLabel()
        
        makeCurrentAnswerField()
        
        makeSubmitButton()
        makeClearButton()
        
        makeLettersView() //LettersView
    }
    
    private func makeScoreLabel() {
        scoreLabel.text = "Score: 0"
    }
    
    private func makeClueLabel() {
        cluesLabel.font = UIFont.systemFont(ofSize: 24)
        cluesLabel.text = "CLUES"
        cluesLabel.numberOfLines = 0
        cluesLabel.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        // TODO: tirar o hugging e usar um tamanho proporcional
    }
    
    private func makeAnswerLabel() {
        answersLabel.font = UIFont.systemFont(ofSize: 24)
        answersLabel.text = "ANSWERS"
        answersLabel.numberOfLines = 0
        answersLabel.textAlignment = .right
        answersLabel.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        // TODO: tirar o hugging e usar um tamanho proporcional
    }
    
    private func makeCurrentAnswerField() {
        currentAnswer.placeholder = "Type letters to guess"
        currentAnswer.textAlignment = .center
        currentAnswer.font = UIFont.systemFont(ofSize: 44)
        currentAnswer.isUserInteractionEnabled = false
    }
    
    private func makeSubmitButton() {
        submit.setTitle("SUBMIT", for: .normal)
    }
    
    private func makeClearButton() {
        clear.setTitle("CLEAR", for: .normal)
    }
    
    private func makeLettersView() {
        
    }
    
    @objc private func submitTapped(_ sender: UIButton) {
        delegate?.didSubmitPressed(sender)
    }
    
    @objc private func clearTapped(_ sender: UIButton) {
        delegate?.didClearPressed(sender)
    }
}

extension GameView: ViewCoding {
    func setup() {
        hierarchyView()
        constraintView()
        aditionalConfigView()
    }
    
    func hierarchyView() {
        self.addSubview(scoreLabel)
        self.addSubview(cluesLabel)
        self.addSubview(answersLabel)
        self.addSubview(currentAnswer)
        self.addSubview(submit)
        self.addSubview(clear)
        self.addSubview(buttonsView)
    }
    
    func constraintView() {
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
            scoreLabel.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            cluesLabel.topAnchor.constraint(equalTo: self.scoreLabel.bottomAnchor),
            cluesLabel.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 100),
            cluesLabel.widthAnchor.constraint(equalTo: self.layoutMarginsGuide.widthAnchor, multiplier: 0.6, constant: -100)
        ])
        
        NSLayoutConstraint.activate([
            answersLabel.topAnchor.constraint(equalTo: self.scoreLabel.bottomAnchor),
            answersLabel.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -100),
            answersLabel.widthAnchor.constraint(equalTo: self.layoutMarginsGuide.widthAnchor, multiplier: 0.4, constant: -100),
            answersLabel.heightAnchor.constraint(equalTo: cluesLabel.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            currentAnswer.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            currentAnswer.topAnchor.constraint(equalTo: cluesLabel.bottomAnchor, constant: 20),
            currentAnswer.widthAnchor.constraint(equalTo: self.layoutMarginsGuide.widthAnchor, multiplier: 0.5)
        ])
        
        NSLayoutConstraint.activate([
            submit.topAnchor.constraint(equalTo: currentAnswer.bottomAnchor),
            submit.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -100),
            submit.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        NSLayoutConstraint.activate([
            clear.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 100),
            clear.centerYAnchor.constraint(equalTo: submit.centerYAnchor),
            clear.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        NSLayoutConstraint.activate([
            buttonsView.widthAnchor.constraint(equalToConstant: 750),
            buttonsView.heightAnchor.constraint(equalToConstant: 320),
            buttonsView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonsView.topAnchor.constraint(equalTo: submit.bottomAnchor, constant: 20),
            buttonsView.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor, constant: -20)
            
//            buttonsView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
//            buttonsView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        ])
        // TODO: usar leading e trailing para dimensionar o buttonView ao invés de usar constants
    }
    
    func aditionalConfigView() {
        self.backgroundColor = .white
        
        submit.addTarget(self, action: #selector(submitTapped), for: .touchUpInside)
        clear.addTarget(self, action: #selector(clearTapped), for: .touchUpInside)
    }
}
