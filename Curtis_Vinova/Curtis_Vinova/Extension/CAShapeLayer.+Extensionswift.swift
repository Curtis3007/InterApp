//
//  CAShapeLayer.+Extensionswift.swift
//  Curtis_Vinova
//
//  Created by CATALINA-ADMIN on 8/18/20.
//  Copyright © 2020 CATALINA-ADMIN. All rights reserved.
//

import Foundation
import UIKit

extension CAShapeLayer {
    @discardableResult
    func applyGradient(colours: [UIColor]) -> CAGradientLayer {
        return self.applyGradient(colours: colours, locations: nil)
    }

    @discardableResult
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        
//        self.layer.insertSublayer(gradient, at: 0)
        self.insertSublayer(gradient, at: 0)
        return gradient
    }
    
    @discardableResult
    func applyGradient(colours: [UIColor], Start: (x: Float, y: Float), End: (x: Float, y: Float)) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.startPoint.x = CGFloat(Start.x)
        gradient.startPoint.y = CGFloat(Start.y)
        gradient.endPoint.x = CGFloat(End.x)
        gradient.endPoint.y = CGFloat(End.y)
        self.insertSublayer(gradient, at: 0)
        return gradient
    }
}
