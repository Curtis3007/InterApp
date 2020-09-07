//
//  CellBoard.swift
//  Curtis_Vinova
//
//  Created by CATALINA-ADMIN on 8/23/20.
//  Copyright © 2020 CATALINA-ADMIN. All rights reserved.
//

import UIKit

class CellBoard: UITableViewCell {
    var tranferIndex: (()->Void)? = nil
    @IBOutlet var lblBoard: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        //tranferIndex?()
        // Configure the view for the selected state
        tranferIndex?()
    }
    
}
