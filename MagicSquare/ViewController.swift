//
//  ViewController.swift
//  Square
//
//  Created by yilmaz on 28.07.2022.
//

import UIKit

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

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

extension UIButton {
    func setBackgroundColor(_ backgroundColor: UIColor, for state: UIControl.State) {
        self.setBackgroundImage(.pixel(ofColor: backgroundColor), for: state)
    }
}

extension UIImage {
  public static func pixel(ofColor color: UIColor) -> UIImage {
    let pixel = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
    UIGraphicsBeginImageContext(pixel.size)
    defer { UIGraphicsEndImageContext() }

    guard let context = UIGraphicsGetCurrentContext() else { return UIImage() }
    context.setFillColor(color.cgColor)
    context.fill(pixel)
    return UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
  }
}

class ViewController: UIViewController {
    
    private lazy var SquareButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Tap Me", for: .normal)
        btn.tintColor = .white
        btn.setBackgroundColor(.systemBlue, for: .normal)
        btn.layer.cornerRadius = 20
        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(squareButtonTap), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let swipeGestureRecognizerUp = UISwipeGestureRecognizer(target: self,
                                                                action: #selector(didSwipe(_:)))

        // Configure Swipe Gesture Recognizer
        swipeGestureRecognizerUp.direction = .up

        // Add Swipe Gesture Recognizer
        SquareButton.addGestureRecognizer(swipeGestureRecognizerUp)
        setupLayout()
    }
    
    private func setupLayout(){
        view.addSubview(SquareButton)
        SquareButton.translatesAutoresizingMaskIntoConstraints = false
        SquareButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        SquareButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        SquareButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        SquareButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    @objc private func didSwipe(_ sender: UISwipeGestureRecognizer) {
        SquareButton.setBackgroundColor(.random(), for: .normal)
    }
    
    @objc private func squareButtonTap() {
        SquareButton.setTitle("\(Int.random(in: 1...6))", for: .normal)
    }
}
