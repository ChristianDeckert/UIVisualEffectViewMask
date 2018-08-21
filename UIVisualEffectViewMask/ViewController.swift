//
//  ViewController.swift
//  UIVisualEffectViewMask
//
//  Created by Christian on 21.08.18.
//  Copyright © 2018 Christian Deckert. All rights reserved.
//

import UIKit

final class ShapeLayerView: UIView {
    var shapeLayer: CAShapeLayer! {
        return layer as? CAShapeLayer
    }
    
    override class var layerClass: AnyClass {
        return CAShapeLayer.self
    }
}


class ViewController: UIViewController {
    
    @IBOutlet weak var visualEffectsView: UIVisualEffectView!
    @IBOutlet weak var imageView: UIVisualEffectView!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let path = UIBezierPath(rect: view.frame)
        
        let rect = CGRect(
            x: view.bounds.width / 2 - 75,
            y: view.bounds.height / 2 - 75,
            width: 150,
            height: 150
        )
        path.append(UIBezierPath(rect: rect).reversing())
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.white.cgColor
        
        let maskView = ShapeLayerView(frame: view.frame)
        maskView.shapeLayer.path = path.cgPath
        maskView.shapeLayer.fillColor = UIColor.white.cgColor
        
        visualEffectsView.mask = maskView

    }

}

