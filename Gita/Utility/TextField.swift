//
//  TextField.swift
//  Gita
//
//  Created by Vivek Thorat on 31/03/24.
//

import Foundation
import UIKit

class UnderLineTextField: UITextField {
    
    private let underlineLayer = CALayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        // Remove default border and background
        borderStyle = .none
        backgroundColor = .clear
        
        // Create and configure the underline layer
        underlineLayer.backgroundColor = UIColor.gray.cgColor
        layer.addSublayer(underlineLayer)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Set the frame for the underline layer
        underlineLayer.frame = CGRect(x: 0, y: frame.size.height - 1, width: frame.size.width, height: 0.5)
    }
    
    func showError() {
        self.underlineLayer.backgroundColor = UIColor.red.cgColor
    }
    
    func removeError() {
        underlineLayer.backgroundColor = UIColor.gray.cgColor
    }
}
