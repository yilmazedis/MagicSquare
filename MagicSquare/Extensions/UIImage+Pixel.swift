//
//  UIImage+Pixel.swift
//  MagicSquare
//
//  Created by yilmaz on 29.07.2022.
//

import UIKit

extension UIImage {
    static func pixel(ofColor color: UIColor) -> UIImage {
        let pixel = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(pixel.size)
        defer { UIGraphicsEndImageContext() }

        guard let context = UIGraphicsGetCurrentContext() else { return UIImage() }
        context.setFillColor(color.cgColor)
        context.fill(pixel)
        return UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
  }
}
