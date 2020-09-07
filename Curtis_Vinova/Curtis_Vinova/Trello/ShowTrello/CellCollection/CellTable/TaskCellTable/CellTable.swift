//
//  CellTable.swift
//  Curtis_Vinova
//
//  Created by CATALINA-ADMIN on 8/26/20.
//  Copyright © 2020 CATALINA-ADMIN. All rights reserved.
//

import UIKit

class CellTable: UITableViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var btnTaskColor: UIButton!
    @IBOutlet weak var lblTaskName: UILabel!
    //@IBOutlet weak var lblTaskDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.02) {
            self.makeCircle()
        }
    }
    
    func makeCircle() {
        self.btnTaskColor.layer.masksToBounds = true
        self.btnTaskColor.layer.cornerRadius  = CGFloat(roundf(Float(self.btnTaskColor.frame.size.height/2.0)))
        self.view.layer.masksToBounds = true
        self.view.layer.cornerRadius  = CGFloat(roundf(Float(self.view.frame.size.height/5.0)))
    }
}
