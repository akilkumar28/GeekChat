//
//  InsetTextField.swift
//  GeekChat
//
//  Created by Akil Kumar Thota on 1/26/19.
//  Copyright © 2019 Akil Kumar Thota. All rights reserved.
//

import UIKit

class InsetTextField: UITextField {

    
    private var padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    
    override func awakeFromNib() {
        setupTextfieldView()
        super.awakeFromNib()
        
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = CGRect.inset(bounds)
        return rect(padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = CGRect.inset(bounds)
        return rect(padding)

    }
    
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        let rect = CGRect.inset(bounds)
        return rect(padding)
    }
    
    
    
    func setupTextfieldView() {
        
        let tPlaceHolder = NSAttributedString(string: self.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        self.attributedPlaceholder = tPlaceHolder
        
    }
    

}
