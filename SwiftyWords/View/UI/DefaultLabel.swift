//
//  Label.swift
//  SwiftyWords
//

import UIKit

class DefaultLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.textAlignment = .right
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
