//
//  LineNear.swift
//  Curtis_Vinova
//
//  Created by CATALINA-ADMIN on 8/18/20.
//  Copyright © 2020 CATALINA-ADMIN. All rights reserved.
//

import UIKit

class LineNear: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        makePath()
    }
    var time: Int = 0
    var isFirst = true
    var percent: Float = 0
    var isProcess: Bool = true
    var isGradien: Bool = true
    var colorList = [UIColor.blue.cgColor, UIColor.red.cgColor]
    @IBOutlet var lblPercent: UILabel!
    @IBOutlet var swProcessControll: UISwitch!
    @IBOutlet var swGradient: UISwitch!
    
    @IBAction func swProcessControll(_ sender: UISwitch) {
        if swProcessControll.isOn {
            isProcess = true
            makePath()
        } else { isProcess = false }
    }
    
    @IBAction func swGradient(_ sender: Any) {
        if swGradient.isOn {
            isGradien = true
            isFirst = true
        } else { isGradien = false
            isFirst = true
        }
    }
    
    @IBOutlet var btnBlueStart: UIView!
    @IBAction func btnRedStart(_ sender: Any) {
        colorList[0] = UIColor.red.cgColor
    }
   
    @IBAction func btnBlueStart(_ sender: Any) {
        colorList[0] = UIColor.blue.cgColor
    }
    
    @IBAction func btnYellowStart(_ sender: Any) {
        colorList[0] = UIColor.yellow.cgColor
    }
    
    @IBAction func btnPurpleStart(_ sender: Any) {
        colorList[0] = UIColor.purple.cgColor
    }
    
    @IBAction func btnRedEnd(_ sender: Any) {
        colorList[1] = UIColor.red.cgColor
    }
    
    @IBAction func btnBlueEnd(_ sender: Any) {
        colorList[1] = UIColor.blue.cgColor
    }
    
    @IBAction func btnYellowEnd(_ sender: Any) {
        colorList[1] = UIColor.yellow.cgColor
    }
    
    @IBAction func btnPurpleEnd(_ sender: Any) {
        colorList[1] = UIColor.purple.cgColor
    }
    
    func makePath() {
        let backgroundPath = UIBezierPath(rect: CGRect(x: self.view.frame.size.width/4, y: self.view.frame.size.height/2, width: self.view.frame.size.width/2, height: 20))
        let backgroundLayer = CAShapeLayer()
        backgroundLayer.path = backgroundPath.cgPath
        backgroundLayer.fillColor = UIColor.black.cgColor
        if time == 0 {
            self.view.layer.addSublayer(backgroundLayer)
            time += 1
        }
        var percentPath = UIBezierPath(rect: CGRect(x: self.view.frame.size.width/4, y: self.view.frame.size.height/2,width: 0, height: 20))
        let percentLayer = CAShapeLayer()
        percentLayer.path = percentPath.cgPath
        self.view.layer.addSublayer(percentLayer)
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
            percentPath = UIBezierPath(rect: CGRect(x: self.view.frame.size.width/4, y: self.view.frame.size.height/2 , width: CGFloat(self.percent*Float(self.view.frame.size.width)/200), height: 20))
            percentLayer.path = percentPath.cgPath
            if self.isGradien {
                let gradient = CAGradientLayer()
                gradient.frame = CGRect(x: self.view.frame.size.width/4, y: self.view.frame.size.height/2 , width: CGFloat((self.percent)*Float(self.view.frame.size.width)/200), height: 20)
                gradient.colors = self.colorList
                gradient.startPoint = CGPoint(x: 0, y: 1)
                gradient.endPoint = CGPoint(x: 1, y: 0)
                self.view.layer.addSublayer(gradient)
                self.isFirst = false
            } else if self.isFirst {
                percentLayer.fillColor = self.colorList[0]
                self.view.layer.addSublayer(percentLayer)
            }
            self.lblPercent.text = "\(Int(self.percent))%"
            if self.percent >= 100 {
                self.percent = 0
                self.time = 0
                timer.invalidate()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.16) {
                    self.makePath()}
            }
            else{
                self.percent += 1
            }
            if !self.isProcess {
                    timer.invalidate()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
