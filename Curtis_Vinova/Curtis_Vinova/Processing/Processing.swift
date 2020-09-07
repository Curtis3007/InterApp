//
//  Processing.swift
//  Curtis_Vinova
//
//  Created by CATALINA-ADMIN on 8/17/20.
//  Copyright © 2020 CATALINA-ADMIN. All rights reserved.
//

import UIKit

class Processing: UIViewController {
    @IBAction func btnLineNear(_ sender: Any) {
        self.navigationController?.pushViewController(LineNear(), animated: true)
    }
    @IBAction func btnCircle(_ sender: Any) {
        self.navigationController?.pushViewController(Circle(), animated: true)
    }
    @IBOutlet var btnCircle: UIButton!
    @IBOutlet var btnLineNear: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Processing"
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        btnCircle.layer.cornerRadius = 30
        btnLineNear.layer.cornerRadius = 30

    }
}
