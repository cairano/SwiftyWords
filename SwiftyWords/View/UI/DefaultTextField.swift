//
//  TextField.swift
//  SwiftyWords
//
//  Created by Carlos Irano on 04/06/20.
//  Copyright © 2020 Carlos Irano. All rights reserved.
//

import UIKit

class DefaultTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
