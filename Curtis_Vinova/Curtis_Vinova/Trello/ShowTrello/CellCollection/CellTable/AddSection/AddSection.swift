//
//  AddSection.swift
//  Curtis_Vinova
//
//  Created by CATALINA-ADMIN on 8/26/20.
//  Copyright © 2020 CATALINA-ADMIN. All rights reserved.
//

import UIKit

class AddSection: UITableViewCell {

    @IBOutlet weak var btnAddTask: UIButton!
    var clickAddSection: (()->Void)? = nil
    @IBAction func ADDTASK(_ sender: Any) {
        clickAddSection?()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.02) {
            self.makeCircle()
        }
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func makeCircle() {
        self.btnAddTask.layer.masksToBounds = true
        self.btnAddTask.layer.cornerRadius  = CGFloat(roundf(Float(self.btnAddTask.frame.size.height/2.0)))
    }
}
