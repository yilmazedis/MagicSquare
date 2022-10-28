//
//  Toast.swift
//  MagicSquare
//
//  Created by yilmaz on 28.10.2022.
//

import UIKit

class Toast {
    static func show(message: String, on baseView: UIView) {
        let containerView = UIView()
        containerView.backgroundColor = .black.withAlphaComponent(0.6)
        containerView.alpha = 0
        containerView.layer.cornerRadius = 25
        containerView.clipsToBounds = true

        let toastLabel = UILabel()
        toastLabel.textColor = .white
        toastLabel.textAlignment = .center
        toastLabel.font.withSize(12.0)
        toastLabel.text = message
        toastLabel.clipsToBounds = true
        toastLabel.numberOfLines = 0
        
        baseView.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 65).isActive = true
        containerView.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -65).isActive = true
        containerView.bottomAnchor.constraint(equalTo: baseView.bottomAnchor, constant: -75).isActive = true

        containerView.addSubview(toastLabel)
        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        toastLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 15).isActive = true
        toastLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15).isActive = true
        toastLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15).isActive = true
        toastLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -15).isActive = true

        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
            containerView.alpha = 1
        }, completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 1.5, options: .curveEaseOut, animations: {
                containerView.alpha = 0
            }, completion: { _ in
                containerView.removeFromSuperview()
            })
        })
    }
}
