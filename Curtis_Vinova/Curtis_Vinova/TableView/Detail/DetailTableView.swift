//
//  DetailTableView.swift
//  Curtis_Vinova
//
//  Created by CATALINA-ADMIN on 8/19/20.
//  Copyright © 2020 CATALINA-ADMIN. All rights reserved.
//

import UIKit

class DetailTableView: UIViewController {
    
    @IBOutlet var lblDetail: UILabel!
    @IBOutlet var lblName: UILabel!
    var name = ""
    var detail = ""
    
    override func viewDidLoad() {
       super.viewDidLoad()
        lblDetail.text = detail
        lblName.text = name
    }

    func setData(nameString: String, detailInformation: String) {
        self.name = nameString
        self.detail = detailInformation
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
