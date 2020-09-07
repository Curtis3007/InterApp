//
//  ViewCell.swift
//  Curtis_Vinova
//
//  Created by CATALINA-ADMIN on 8/19/20.
//  Copyright © 2020 CATALINA-ADMIN. All rights reserved.
//

import UIKit

class ViewCell: UITableViewCell {

    @IBOutlet var btnDetail: UIButton!
    @IBOutlet var lblName: UILabel!
    var index: Int = 0
    var dob: String = "No information"
    var company: String = "No information"
    var address: String = "No information"
    var founded: String = "No information"
    var co_founders: [String] = ["No information", ""]
    var clickDetail: (() -> Void)? = nil
    //weak var delegate: clickDetail?
    
    @IBAction func btnDetail(_ sender: Any) {
        clickDetail?()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.02) {
            self.makeCircle()
        }
            //btnDetail.applyGradient(colours: [.red, .blue])
        // Initialization code
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
        
    func makeCircle() {
        self.btnDetail.layer.masksToBounds = true
        self.btnDetail.layer.cornerRadius  = CGFloat(roundf(Float(self.btnDetail.frame.size.height/2.0)))
    }
    
    func requestData(completion: ((_ data: String) -> Void)) {
       // the data was received and parsed to String
         let data = "DOB: \(dob)"
        completion(data)
    }
}
