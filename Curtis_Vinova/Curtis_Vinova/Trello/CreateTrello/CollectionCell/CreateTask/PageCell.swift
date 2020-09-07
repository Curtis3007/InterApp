//
//  PageCell.swift
//  Curtis_Vinova
//
//  Created by CATALINA-ADMIN on 8/23/20.
//  Copyright © 2020 CATALINA-ADMIN. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    var chooseColor: (() -> Void)? = nil
    var chooseBoard: (() -> Void)? = nil
    var chooseGroup: (() -> Void)? = nil
    
    @IBAction func CHOOSEBOARD(_ sender: Any) {
        chooseBoard?()
    }
    @IBAction func CHOOSEGROUP(_ sender: Any) {
        chooseGroup?()
    }
    @IBAction func CHOOSECOLOR(_ sender: Any) {
        chooseColor?()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
