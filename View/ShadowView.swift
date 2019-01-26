//
//  ShadowView.swift
//  GeekChat
//
//  Created by Akil Kumar Thota on 1/26/19.
//  Copyright © 2019 Akil Kumar Thota. All rights reserved.
//

import UIKit

class ShadowView: UIView {
    
    override func awakeFromNib() {
        setupView()
        super.awakeFromNib()
    }

    func setupView() {
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 5
        self.layer.shadowColor = UIColor.black.cgColor
    }

}
