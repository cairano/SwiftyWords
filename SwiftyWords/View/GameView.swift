//
//  view.swift
//  SwiftyWords
//
//  Created by Carlos Irano on 03/06/20.
//  Copyright © 2020 Carlos Irano. All rights reserved.
//

import UIKit

class GameView: UIView {
    let scoreLabel = DefaultLabel()
    let cluesLabel = DefaultLabel()
    let answersLabel = DefaultLabel()
    
    let currentAnswer = DefaultTextField()
    
    let submit = DefaultButton(type: .system)
    let clear = DefaultButton(type: .system)
    
    let buttonsView = ButtonsView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        makeScoreLabel()
        makeClueLabel()
        makeAnswerLabel()
        
        makeCurrentAnswerField()
        
        makeSubmitButton()
        makeClearButton()
        
        makeLettersView() //LettersView
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func makeScoreLabel() {
        scoreLabel.text = "Score: 0"
        self.addSubview(scoreLabel)
        
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
            scoreLabel.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor)
        ])
    }
    
    private func makeClueLabel() {
        cluesLabel.font = UIFont.systemFont(ofSize: 24)
        cluesLabel.text = "CLUES"
        cluesLabel.numberOfLines = 0
        cluesLabel.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        self.addSubview(cluesLabel)
        // TODO: tirar o hugging e usar um tamanho proporcional
        
        NSLayoutConstraint.activate([
            cluesLabel.topAnchor.constraint(equalTo: self.scoreLabel.bottomAnchor),
            cluesLabel.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 100),
            cluesLabel.widthAnchor.constraint(equalTo: self.layoutMarginsGuide.widthAnchor, multiplier: 0.6, constant: -100)
        ])
    }
    
    private func makeAnswerLabel() {
        answersLabel.font = UIFont.systemFont(ofSize: 24)
        answersLabel.text = "ANSWERS"
        answersLabel.numberOfLines = 0
        answersLabel.textAlignment = .right
        answersLabel.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        self.addSubview(answersLabel)
        // TODO: tirar o hugging e usar um tamanho proporcional
        
        NSLayoutConstraint.activate([
            answersLabel.topAnchor.constraint(equalTo: self.scoreLabel.bottomAnchor),
            answersLabel.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -100),
            answersLabel.widthAnchor.constraint(equalTo: self.layoutMarginsGuide.widthAnchor, multiplier: 0.4, constant: -100),
            answersLabel.heightAnchor.constraint(equalTo: cluesLabel.heightAnchor)
        ])
    }
    
    private func makeCurrentAnswerField() {
        currentAnswer.placeholder = "Type letters to guess"
        currentAnswer.textAlignment = .center
        currentAnswer.font = UIFont.systemFont(ofSize: 44)
        currentAnswer.isUserInteractionEnabled = false
        self.addSubview(currentAnswer)
        
        NSLayoutConstraint.activate([
            currentAnswer.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            currentAnswer.topAnchor.constraint(equalTo: cluesLabel.bottomAnchor, constant: 20),
            currentAnswer.widthAnchor.constraint(equalTo: self.layoutMarginsGuide.widthAnchor, multiplier: 0.5)
        ])
    }
    
    private func makeSubmitButton() {
        submit.setTitle("SUBMIT", for: .normal)
        self.addSubview(submit)
        
        NSLayoutConstraint.activate([
            submit.topAnchor.constraint(equalTo: currentAnswer.bottomAnchor),
            submit.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -100),
            submit.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func makeClearButton() {
        clear.setTitle("CLEAR", for: .normal)
        self.addSubview(clear)
        
        NSLayoutConstraint.activate([
            clear.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 100),
            clear.centerYAnchor.constraint(equalTo: submit.centerYAnchor),
            clear.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func makeLettersView() {
        self.addSubview(buttonsView)
        
        NSLayoutConstraint.activate([
            buttonsView.widthAnchor.constraint(equalToConstant: 750),
            buttonsView.heightAnchor.constraint(equalToConstant: 320),
            buttonsView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonsView.topAnchor.constraint(equalTo: submit.bottomAnchor, constant: 20),
            buttonsView.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor, constant: -20)
            
//            buttonsView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
//            buttonsView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        ])
        // TODO: usar leading e trailing para dimensionar o buttonView
    }
}
