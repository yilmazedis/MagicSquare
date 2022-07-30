//
//  ViewController.swift
//  Square
//
//  Created by yilmaz on 28.07.2022.
//

import UIKit

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
    
    //        let randomFloat = Float.random(in: 1..<10)
    //        let randomDouble = Double.random(in: 1...100)
    //        let randomCGFloat = CGFloat.random(in: 1...1000)
    //        let randomBool = Bool.random()
    //
    //        let numbers = [1, 2, 3]
    //        let shuffledNumbers = (numbers as NSArray).shuffled() as! [Int]
    //
    //        var albums = ["Red", "1989", "Reputation"]
    //        // shuffle in place
    //        albums.shuffle()
    //        // get a shuffled array back
    //        let shuffled = albums.shuffled()
    //
    //        if let random = albums.randomElement() {
    //            print("The random album is \(random).")
    //        }
    @objc private func squareButtonTap() {
        SquareButton.setTitle("\(Int.random(in: 1...6))", for: .normal)
    }
}
