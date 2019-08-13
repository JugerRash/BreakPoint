//
//  InsetTextField.swift
//  BreakPoint
//
//  Created by juger rash on 09.08.19.
//  Copyright © 2019 juger rash. All rights reserved.
//

import UIKit

class InsetTextField: UITextField {

    //Vareiables -:
    private var padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    
    //Functions -:
    override func awakeFromNib() {
        setupView()
        super.awakeFromNib() // this just cuz apple wants us to call this function
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect { // this func is jsut when u look at the text where it positioned
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect { // this func when u editing the text where the text should be while editing
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect { // this for placeholder
        return bounds.inset(by: padding)
    }
    
    // this func to change the placeholder color
    func setupView(){
        let placeHolder = NSAttributedString(string: self.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        self.attributedPlaceholder = placeHolder
    }

}
