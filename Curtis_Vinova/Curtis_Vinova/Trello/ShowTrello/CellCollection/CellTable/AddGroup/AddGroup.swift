//
//  AddGroup.swift
//  Curtis_Vinova
//
//  Created by CATALINA-ADMIN on 8/28/20.
//  Copyright © 2020 CATALINA-ADMIN. All rights reserved.
//

import UIKit

class AddGroup: UITableViewCell {
    @IBOutlet weak var btnAddGroup: UIButton!
    var clickAddGroup: (()->Void)? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.02) {
//            self.makeCircle()
//        }
        // Initialization code
    }
    
    @IBAction func ADDGROUP(_ sender: Any) {
        clickAddGroup?()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
//    func makeCircle() {
//        self.btnAddGroup.layer.masksToBounds = true
//        self.btnAddGroup.layer.cornerRadius  = CGFloat(roundf(Float(self.btnAddGroup.frame.size.height/2.0)))
//    }
    
}
