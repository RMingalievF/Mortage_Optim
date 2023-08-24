//
//  CastomizationClass.swift
//  Mortage_Optim
//
//  Created by Руслан Мингалиев on 24.08.2023.
//

import UIKit

class CustomTextFieldLogin: UITextField {

    override init(frame: CGRect){
        super.init(frame: frame)
        setupTextField()
        }
    
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        setupTextField()
    }
    
    func setupTextField() {
        let textView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        leftView = textView
        leftViewMode = .always
        borderStyle = UITextField.BorderStyle.none
        
        tintColor = UIColor.white
        isSecureTextEntry = false
        tintColor = UIColor.white
        layer.borderColor = UIColor.white.withAlphaComponent(1).cgColor
        layer.cornerRadius = 5
        layer.borderWidth = 0.5
        layer.maskedCorners = [.layerMaxXMinYCorner,
                               .layerMinXMinYCorner,
                               .layerMaxXMaxYCorner,
                               .layerMinXMaxYCorner]
        
    }
        
    
}

class CustomTextFieldPass: UITextField {

    override init(frame: CGRect){
        super.init(frame: frame)
        setupTextField()
        }
    
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        setupTextField()
    }
    
    func setupTextField() {
        let textView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        leftView = textView
        leftViewMode = .always
        borderStyle = UITextField.BorderStyle.none
        
        isSecureTextEntry = true
        tintColor = UIColor.white
        
       // attributedPlaceholder = NSAttributedString(string: "placeholder text", attributes:[NSAttributedString.Key.foregroundColor: UIColor.white])
        layer.borderColor = UIColor.white.withAlphaComponent(1).cgColor
        layer.cornerRadius = 5
        layer.borderWidth = 0.5
        layer.maskedCorners = [.layerMaxXMinYCorner,
                               .layerMinXMinYCorner,
                               .layerMaxXMaxYCorner,
                               .layerMinXMaxYCorner]
        

    }
        
    
}

class CustomButtomLoginInWith: UIButton {
    override init(frame: CGRect){
        super.init(frame: frame)
        setupRadiusBottom()
    }
    
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        setupRadiusBottom()
    }
    
    func setupRadiusBottom() {
        layer.cornerRadius = 5
        layer.masksToBounds = true
        
    }
    
}
