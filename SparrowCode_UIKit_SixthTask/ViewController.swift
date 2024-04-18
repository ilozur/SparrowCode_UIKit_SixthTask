//
//  ViewController.swift
//  SparrowCode_UIKit_SixthTask
//
//  Created by Edmond Podlegaev on 18.04.2024.
//

import UIKit

class ViewController: UIViewController {

    var square: UIView = {
        let view = UIView()
        view.bounds.size = .init(width: 100, height: 100)
        view.layer.cornerRadius = 10
        view.backgroundColor = .systemBlue
        return view
    }()
    
    lazy var dynamicAnimator = UIDynamicAnimator(referenceView: view)
    lazy var snapBehavior = UISnapBehavior(item: square, snapTo: view.center)


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(square)
        square.center = view.center
        dynamicAnimator.addBehavior(snapBehavior)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchCoordinates = touches.first?.location(in: view) else { return }
        snapBehavior.snapPoint = touchCoordinates
    }
}
