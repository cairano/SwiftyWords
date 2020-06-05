//
//  LetterButton.swift
//  SwiftyWords
//

import UIKit

class LetterButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.translatesAutoresizingMaskIntoConstraints = true
        
//        self.titleLabel?.font = UIFont.systemFont(ofSize: 36)
//        self.layer.borderWidth = 1
//        self.layer.borderColor = UIColor.gray.cgColor
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
