//
//  Label.swift
//  SwiftyWords
//
//  Created by Carlos Irano on 04/06/20.
//  Copyright © 2020 Carlos Irano. All rights reserved.
//

import UIKit

class DefaultLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        setDefaultStyle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setDefaultStyle() {
        self.textAlignment = .right
    }
}
