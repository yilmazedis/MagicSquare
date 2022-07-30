//
//  UIColor+Random.swift
//  MagicSquare
//
//  Created by yilmaz on 29.07.2022.
//

import UIKit

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
}
