//
//  ButtonsView.swift
//  SwiftyWords
//

import UIKit

class ButtonsView: UIView {
    var buttons = [LetterButton]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
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
                letterButton.setTitle("WWW", for: .normal)
                letterButton.titleLabel?.font = UIFont.systemFont(ofSize: 36)
                letterButton.layer.borderWidth = 1
                letterButton.layer.borderColor = UIColor.gray.cgColor
                
                let frame = CGRect(x: col * width, y: row * height, width: width, height: height)
                letterButton.frame = frame
                
                self.addSubview(letterButton)
                
                buttons.append(letterButton)
            }
        }
    }
    // TODO: colocar uma distancia entre os botões
}
