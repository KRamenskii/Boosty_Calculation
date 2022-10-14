//
//  UIStackView + Extensions.swift
//  Boosty_Calculation
//
//  Created by Кирилл Раменский on 14.10.2022.
//

import UIKit

extension UIStackView {
    
    convenience init(subviews: [UIView]) {
        self.init(arrangedSubviews: subviews)
        self.axis = .horizontal
        self.spacing = 1
        self.distribution = .fillEqually
    }
}
