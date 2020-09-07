//
//  BoardCollection.swift
//  Curtis_Vinova
//
//  Created by CATALINA-ADMIN on 8/25/20.
//  Copyright © 2020 CATALINA-ADMIN. All rights reserved.
//

import UIKit

class BoardCollection: UICollectionViewCell {
    @IBOutlet var btnBoard: UIButton!
    var i = 1
    var clickBoard: (() -> Void)? = nil
    var colorButton = UIColor.gray {
        didSet {
            btnBoard.backgroundColor = colorButton
        }
    }
    @IBAction func SELECT(_ sender: Any) {
        clickBoard?()
    }
    
    override func awakeFromNib() {
        //super.awakeFromNib()
//        self.btnBoard.layer.backgroundColor = self.colorButton
        makeCircle()
        // Initialization code
    }
    
    func makeCircle() {
        self.btnBoard.layer.masksToBounds = true
        //self.btnBoard.layer.cornerRadius  = self.btnBoard.layer.frame.size.height/2
        self.btnBoard.layer.borderWidth = 0.5
        self.btnBoard.layer.borderColor = UIColor.blue.cgColor
    }
}
