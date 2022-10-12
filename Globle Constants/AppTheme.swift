//
//  AppTheme.swift
//  Sunil Zalavadiya
//
//  Created by Sunil Zalavadiya on 04/07/20.
//  Copyright © 2020 Sunil Zalavadiya. All rights reserved.
//

import Foundation
import UIKit

class AppTheme {
    class func setupTextField(textField: UITextField, rightButton: UIButton, icon: UIImage) {
        rightButton.frame = CGRect(x: 0, y: 0, width: 30, height: textField.frame.height)
        rightButton.setImage(icon, for: .normal)
        
        let viewContainer = UIView()
        viewContainer.frame = CGRect(x: 0, y: 0, width: 40, height: textField.frame.height)
        viewContainer.addSubview(rightButton)
        textField.addLeftPadding(padding: 15)
        textField.rightView = viewContainer
        textField.rightViewMode = .always
    }
//class func setupTextField(textView: UITextView, rightButton: UIButton, icon: UIImage) {
//     rightButton.frame = CGRect(x: 0, y: 0, width: 30, height: 53)
//     rightButton.setImage(icon, for: .normal)
//
//     let viewContainer = UIView()
//     viewContainer.frame = CGRect(x: 0, y: 0, width: 40, height: 53)
//     viewContainer.addSubview(rightButton)
//     textView.addLeftPadding(padding: 15)
//     textView.rightView = viewContainer
//     textView.rightViewMode = .always
// }
    
    class func applyGeneralInputTheme(toView: UIView) {
        toView.addCornerRadius(7)
        (toView as? UITextField)?.addLeftPadding(padding: 15)
        self.applyGeneralInputBackground(toView: toView)
        self.applyGeneralInputBorder(toView: toView)
    }
    
    class func applyGeneralInputBorder(toView: UIView) {
        toView.applyBorder(1, borderColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1195151969))
    }
    
    class func applyGeneralInputBackground(toView: UIView) {
        toView.backgroundColor = #colorLiteral(red: 0.1960784314, green: 0.2117647059, blue: 0.2509803922, alpha: 0.3303724315)
    }
    
//    class func applyGeneralButtonTheme(toBtn: UIButton) {
//        toBtn.setBackgroundImage(UIImage.gradientImageWith(size: toBtn.frame.size, colors: Application.Color.GRADIENT), for: .normal)
//        toBtn.addCornerRadius(toBtn.frame.size.height / 2.0)
//    }
    
//    class func applyGeneralButtonTheme(toview: UIView) {
//
//    toview.setBackgroundImage(UIImage.gradientImageWith(size: toview.frame.size, colors: Application.Color.GRADIENT), for: .normal)
//    toview.addCornerRadius(toview.frame.size.height / 2.0)
}
