//
//  TaskCollection.swift
//  Curtis_Vinova
//
//  Created by CATALINA-ADMIN on 8/25/20.
//  Copyright © 2020 CATALINA-ADMIN. All rights reserved.
//

import UIKit

class TaskCollection: UICollectionViewCell {
    @IBOutlet var btnTask: UIButton!
    var clickTask: (() -> Void)? = nil
    var colorButton = UIColor.blue {
        didSet {
            btnTask.backgroundColor = colorButton
        }
    }
    
    override func awakeFromNib() {
        //super.awakeFromNib()
        makeCircle()
//        self.btnTask.layer.backgroundColor = self.colorButton
        //print("Task: \(self.colorButton)")
    }
    
    @IBAction func SELECT(_ sender: Any) {
        clickTask?()
    }
    
    func makeCircle() {
        self.btnTask.layer.masksToBounds = true
        //self.btnTask.layer.cornerRadius  = self.btnTask.layer.frame.size.height/2
        self.btnTask.layer.borderWidth = 0.5
        self.btnTask.layer.borderColor = UIColor.blue.cgColor
    }
    
//    func setColor(color: CGColor) {
//        self.colorButton = color
//        //btnTask.layer.backgroundColor = color
//    }
}
