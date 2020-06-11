//
//  ButtonsView.swift
//  SwiftyWords
//

import UIKit

protocol ButtonViewDelegate: AnyObject {
    func didLetterPressed(_ sender: UIButton)
}

class ButtonsView: UIView {
    weak var delegate: ButtonViewDelegate?
    
    var buttons = [LetterButton]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        setup()
        makeLetterButtons()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func makeLetterButtons() {
        let width = 150
        let height = 80
        
        for row in 0 ..< 4 {
            for col in 0 ..< 5 {
                let letterButton = LetterButton(type: .system)
                letterButton.titleLabel?.font = UIFont.systemFont(ofSize: 36)
                letterButton.addTarget(self, action: #selector(letterTapped), for: .touchUpInside)
                
                let frame = CGRect(x: col * width, y: row * height, width: width, height: height)
                letterButton.frame = frame
                
                self.addSubview(letterButton)
                
                buttons.append(letterButton)
            }
        }
    }
    // TODO: colocar uma distancia entre os botões
    
    @objc private func letterTapped(_ sender: UIButton) {
        delegate?.didLetterPressed(sender)
    }
}

extension ButtonsView: ViewCoding {
    func setup() {
        hierarchyView()
        constraintView()
        aditionalConfigView()
    }
    
    func hierarchyView() {
        //
    }
    
    func constraintView() {
        //
    }
    
    func aditionalConfigView() {
        backgroundColor = .cyan
    }
}
