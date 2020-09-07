//
//  PageCellAfter.swift
//  Curtis_Vinova
//
//  Created by CATALINA-ADMIN on 8/23/20.
//  Copyright © 2020 CATALINA-ADMIN. All rights reserved.
//

import UIKit

class PageCellAfter: UICollectionViewCell {

    //@IBOutlet weak var viewOfNameBoard: UIView!
    @IBOutlet weak var btnColor: UIButton!
    weak var push: ChooseColorBoard?
    @IBOutlet var btnAdd: UIButton!
    @IBOutlet weak var txtDescription: UITextField!
    @IBOutlet var txtNameBoard: UITextField!
    var clickColor: (() -> Void)? = nil
    var reloadBoard: (() -> Void)? = nil
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBAction func addBoard(_ sender: Any) {
        let newBoard = Board(context: context)
        newBoard.boardDecription = txtDescription.text
        newBoard.boardName = txtNameBoard.text
        newBoard.numOfGroup = 0
        newBoard.boardColor = "blue"
        newBoard.boardID = UUID()
        do {
            try self.context.save()
            print("Save Success")
            print(newBoard.boardID!)
            print(newBoard.boardName!)
            print(newBoard.boardDecription!)
        } catch {
            print("Save Fail")
        }
        txtNameBoard.text = ""
        reloadBoard?()
    }
    @IBAction func selectColor(_ sender: Any) {
        clickColor?()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //viewOfNameBoard.layer.borderColor = UIColor.white.cgColor
        //viewOfNameBoard.layer.borderWidth = 1
        
    }

}
