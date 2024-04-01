//
//  Button.swift
//  Gita
//
//  Created by Vivek Thorat on 01/04/24.
//

import Foundation
import UIKit

class LoginButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        self.layer.cornerRadius = 8
        self.backgroundColor = .systemBlue
        layer.masksToBounds = true
    }
}
