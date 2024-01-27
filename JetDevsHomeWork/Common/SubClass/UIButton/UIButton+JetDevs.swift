//
//  UIButton+JetDevs.swift
//  JetDevsHomeWork
//
//  Created by ihsan on 28/01/24.
//

import Foundation

import UIKit

@IBDesignable
class AppButtonPrimary: UIButton {
    
    override var isUserInteractionEnabled: Bool {
        didSet {
            setButtonColor()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    
    func setup() {
        self.layer.cornerRadius = 6
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = .latoBoldFont(size: 18)
        setButtonColor()
    }
    
    func setButtonColor() {
        if self.isUserInteractionEnabled {
            self.backgroundColor = .PrimaryColor
        } else {
            self.backgroundColor = .GrayDisable
        }
    }
}
