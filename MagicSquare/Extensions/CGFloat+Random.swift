//
//  CGFloat+Random.swift
//  MagicSquare
//
//  Created by yilmaz on 29.07.2022.
//

import UIKit

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
