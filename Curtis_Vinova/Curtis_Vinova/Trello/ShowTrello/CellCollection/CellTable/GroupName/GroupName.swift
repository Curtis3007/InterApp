//
//  GroupName.swift
//  Curtis_Vinova
//
//  Created by CATALINA-ADMIN on 8/31/20.
//  Copyright © 2020 CATALINA-ADMIN. All rights reserved.
//

import UIKit

class GroupName: UITableViewCell {

    @IBOutlet weak var lblGroupName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.backgroundColor = UIColor.darkGray
        // Configure the view for the selected state
    }
    
}
