//
//  MoreTaskSetting.swift
//  Curtis_Vinova
//
//  Created by CATALINA-ADMIN on 8/31/20.
//  Copyright © 2020 CATALINA-ADMIN. All rights reserved.
//

import UIKit

class MoreTaskSetting: UIViewController {
    @IBOutlet weak var stvTaskName: UIStackView!
    var chooseTime: (()->Void)? = nil
    var chooseColor: (()->Void)? = nil
    
    @IBAction func CHOOSETIME(_ sender: Any) {
        chooseTime?()
    }
    
    @IBAction func CHOOSECOLOR(_ sender: Any) {
        chooseColor?()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
