//
//  Custombutton.swift
//  Go Trekkers
//
//  Created by Parth Patel on 01/04/24.
//

import UIKit

@IBDesignable
class CustomButton: UIButton {
    
    // Corner radius of the button
    @IBInspectable var cornerRadius: CGFloat = 8.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
        }
    }
    
    // Title font style
    @IBInspectable var titleFont: UIFont = UIFont.systemFont(ofSize: 16.0) {
        didSet {
            titleLabel?.font = titleFont
        }
    }
    
    // Font color of the title
    @IBInspectable var titleColor: UIColor = UIColor.white {
        didSet {
            setTitleColor(titleColor, for: .normal)
        }
    }
    
    // Background color of the button
    @IBInspectable var buttonColor: UIColor = #colorLiteral(red: 0.6200000048, green: 0.7839999795, blue: 0.7250000238, alpha: 1) {
        didSet {
            backgroundColor = buttonColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupButton()
    }
    
    private func setupButton() {
        layer.cornerRadius = cornerRadius
        setTitleColor(titleColor, for: .normal)
        backgroundColor = buttonColor
        titleLabel?.font = titleFont
    }
}

