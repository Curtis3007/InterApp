//
//  Circle.swift
//  Curtis_Vinova
//
//  Created by CATALINA-ADMIN on 8/18/20.
//  Copyright © 2020 CATALINA-ADMIN. All rights reserved.
//

import UIKit

class Circle: UIViewController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        btnButton.applyGradient(colours: [.black, .blue], Start: (x: 0.25, y: 0.5), End: (x: 0.75, y: 0.5))
//        // Do any additional setup after loading the view.
//    }

    override func viewDidAppear(_ animated: Bool) {
            makePath()
        }
        var time: Int = 0
        var isPause: Bool = false
        var isStop = false
        var percent: Float = 0
        var isProcess: Bool = true
        var isGradien: Bool = true
        var colorList = [UIColor.blue.cgColor, UIColor.red.cgColor]
        var percentLayer = CAShapeLayer()
        var gradient = CAGradientLayer()
//        @IBOutlet var lblPercent: UILabel!
    
    @IBOutlet var lblPercent: UILabel!
    @IBOutlet var swGradient: UISwitch!
    @IBOutlet var swProcess: UISwitch!
    
    @IBAction func swProcess(_ sender: Any) {
        if swProcess.isOn {
            isProcess = true
            percentLayer.removeFromSuperlayer()
            gradient.removeFromSuperlayer()
            if swGradient.isOn { makePath()}
            else {makePathSingleColor()}
            
        } else {
            isProcess = false
        }
    }
    
    @IBAction func swGradient(_ sender: Any) {
        if swGradient.isOn {
            isGradien = true
            isStop = true
            percentLayer.removeFromSuperlayer()
            gradient.removeFromSuperlayer()
            makePath()
        } else {
            isGradien = false
            isStop = true
            percentLayer.removeFromSuperlayer()
            gradient.removeFromSuperlayer()
            makePathSingleColor()
        }
    }
    
    @IBAction func startRed(_ sender: Any) {
        colorList[1] = UIColor.red.cgColor
    }
    
    @IBAction func startBlue(_ sender: Any) {
        colorList[1] = UIColor.blue.cgColor
    }
    
    @IBAction func startYellow(_ sender: Any) {
        colorList[1] = UIColor.yellow.cgColor
    }
    
    @IBAction func startPurple(_ sender: Any) {
        colorList[1] = UIColor.purple.cgColor
    }
    
    @IBAction func endRed(_ sender: Any) {
        colorList[0] = UIColor.red.cgColor
    }
    
    @IBAction func endBlue(_ sender: Any) {
        colorList[0] = UIColor.blue.cgColor
    }
    
    @IBAction func endYellow(_ sender: Any) {
        colorList[0] = UIColor.yellow.cgColor
    }
    
    @IBAction func endPurple(_ sender: Any) {
        colorList[0] = UIColor.purple.cgColor
    }
 
    func makePath() {
        let lineWidth: CGFloat = 20
        let radius = self.view.frame.size.width/4 - lineWidth
        let frame = CGRect.init(origin: CGPoint(x: self.view.frame.midX - radius, y: self.view.frame.midY - radius), size: .init(width: radius * 2 + lineWidth, height: radius * 2 + lineWidth))
        let circlePath = UIBezierPath(arcCenter: .init(x: radius, y: radius), radius: radius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        circlePath.lineWidth = 20
        percentLayer = CAShapeLayer()
        percentLayer.path = circlePath.cgPath
        percentLayer.frame = .init(origin: .init(x: lineWidth / 2, y: lineWidth / 2), size: .init(width: radius, height: radius))
        percentLayer.strokeColor = self.colorList[0]
        percentLayer.fillColor = nil
        percentLayer.strokeStart = 0
        percentLayer.strokeEnd = 0
        percentLayer.lineWidth = lineWidth
            
        gradient = CAGradientLayer()
        gradient.frame = frame
        gradient.colors = self.colorList
        gradient.mask = percentLayer
        self.view.layer.addSublayer(gradient)

        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
                        
            self.percentLayer.strokeEnd = CGFloat(self.percent / 100)
            self.gradient.colors = self.colorList
            self.lblPercent.text = "\(Int(self.percent))%"
            if self.percent >= 100 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    self.percent = 0
                }
            }
            else{self.percent += 1}
            if !self.isProcess || self.isStop {
                self.isStop = false
                timer.invalidate()
            }
        }
    }
          func makePathSingleColor() {
                let lineWidth: CGFloat = 20
                let radius = self.view.frame.size.width/4 - lineWidth
                let frame = CGRect.init(origin: CGPoint(x: self.view.frame.midX - radius, y: self.view.frame.midY - radius), size: .init(width: radius * 2 + lineWidth, height: radius * 2 + lineWidth))
                let circlePath = UIBezierPath(arcCenter: .init(x: radius, y: radius), radius: radius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
                circlePath.lineWidth = 20
                percentLayer = CAShapeLayer()
                percentLayer.path = circlePath.cgPath
                percentLayer.frame = .init(origin: .init(x: lineWidth / 2, y: lineWidth / 2), size: .init(width: radius, height: radius))
                percentLayer.strokeColor = self.colorList[1]
                percentLayer.fillColor = nil
                percentLayer.strokeStart = 0
                percentLayer.strokeEnd = 0
                percentLayer.lineWidth = lineWidth
                    
                gradient = CAGradientLayer()
                gradient.frame = frame
                gradient.colors = self.colorList
                gradient.mask = percentLayer
                percentLayer.frame = frame
                self.view.layer.addSublayer(percentLayer)

                Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
                                
                    self.percentLayer.strokeEnd = CGFloat(self.percent / 100)
                    self.gradient.colors = self.colorList
                    self.percentLayer.strokeColor = self.colorList[1]
                    self.lblPercent.text = "\(Int(self.percent))%"
                    if self.percent >= 100 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            self.percent = 0
                        }
                    }
                    else{ self.percent += 1}
                    if !self.isProcess || self.isStop {
                        self.isStop = false
                        timer.invalidate()
                    }
                }
            }
        override func viewDidLoad() {
            super.viewDidLoad()

            // Do any additional setup after loading the view.
        }
}


//                    if self.isGradien {
 //                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
 //                        self.view.layer.addSublayer(bufferLayer)
 //                        }
 //                    } else {self.view.layer.addSublayer(bufferLayer)}
 //                    self.time = 0
 //                    timer.invalidate()
 //                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.16) {
 //                        self.makePath()}
//        func makePath() {
//            //create path
//            let center = CGPoint(x: self.view.frame.midX, y: self.view.frame.midY)
//
//            let backgroundPath = UIBezierPath(arcCenter: center, radius: self.view.frame.size.width/4, startAngle: -CGFloat.pi, endAngle: CGFloat.pi, clockwise: true)
//            //create layer
//            let backgroundLayer = CAShapeLayer()
//            //set path for layer
//            backgroundLayer.path = backgroundPath.cgPath
//            //set color background
//            backgroundLayer.fillColor = UIColor.clear.cgColor
//            backgroundLayer.strokeColor = UIColor.white.cgColor
//            backgroundLayer.lineWidth = 20
//            //add layer to view (set from path)
//            if time == 0 {
//                self.view.layer.addSublayer(backgroundLayer)
//                time += 1
//            }
//            //new path to show red percent
////            var percentPath = UIBezierPath(arcCenter: center, radius: self.view.frame.size.width/4, startAngle: 0, endAngle: 0, clockwise: true)
//            let percentLayer = CAShapeLayer()
//            //let trackLayer = CAShapeLayer()
////            percentLayer.path = percentPath.cgPath
////            percentLayer.fillColor = UIColor.clear.cgColor
////            backgroundLayer.strokeColor = UIColor.red.cgColor
////            backgroundLayer.lineWidth = 20
////            self.view.layer.addSublayer(percentLayer)
//            //replace dispathQueue to Timer.schedule ---> research.
//            Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
//                let radius = self.view.frame.size.width/2
//
//                let percentPath = UIBezierPath(arcCenter: center, radius: radius / 2, startAngle: 0, endAngle: CGFloat(self.percent*Float(2*CGFloat.pi/100)), clockwise: true)
//                //TrackLayer
////                trackLayer.path = percentPath.cgPath
////                trackLayer.fillColor = UIColor.lightgray.cgColor
////                trackLayer.strokeColor = UIColor.clear.cgColor
////                trackLayer.lineWidth = 20
////                trackLayer.lineCap = CAShapeLayerLineCap.round
//                //CGFloat(self.percent*Float(2*CGFloat.pi/100))
//                percentLayer.path = percentPath.cgPath
//                percentLayer.fillColor = UIColor.clear.cgColor
//                percentLayer.strokeColor = UIColor.red.cgColor
//                percentLayer.lineCap = CAShapeLayerLineCap.round
//                percentLayer.strokeColor = self.colorList[0]
//                percentLayer.lineWidth = 20
//                //self.view.layer.addSublayer(percentLayer)
//                if self.isGradien {
////                    let shape = CAShapeLayer()
////                    shape.path = percentPath.cgPath
////                    shape.lineWidth = 20
////                    shape.fillColor = UIColor.clear.cgColor
////                    shape.strokeColor = UIColor.magenta.cgColor
////                    self.view.layer.addSublayer(shape)
//
//                    let gradient = CAGradientLayer()
//                    gradient.frame = percentLayer.bounds
//                    // CGRect.init(origin: CGPoint(x: self.view.frame.midX - radius / 2, y: self.view.frame.midY - radius / 2 ), size: .init(width: radius, height: radius))
//                    gradient.colors = self.colorList
////                    gradient.startPoint = CGPoint(x: 0, y: 1)
////                    gradient.endPoint = CGPoint(x: 1, y: 0)
//                    //gradient.mask = percentLayer
//
//                    //self.view.layer.addSublayer(trackLayer)
//                    self.view.layer.addSublayer(gradient)
//                    self.isFirst = false
//                } else if self.isFirst {
//                    percentLayer.strokeColor = self.colorList[0]
//                    self.view.layer.addSublayer(percentLayer)
//                }
//
//                self.lblPercent.text = "\(Int(self.percent))%"
//                if self.percent >= 100 {
//                    self.percent = 0
//                    if self.isGradien {
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
//                        self.view.layer.addSublayer(backgroundLayer)
//                        }
//                    } else {self.view.layer.addSublayer(backgroundLayer)}
////                    self.time = 0
////                    timer.invalidate()
////                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.16) {
////                        self.makePath()}
//                }
//                else{
//                    self.percent += 1
//                }
//
//                if !self.isProcess {
//                    timer.invalidate()
//                }
//            }
//        }
