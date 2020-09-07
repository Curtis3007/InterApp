//
//  ShowTrello.swift
//  Curtis_Vinova
//
//  Created by CATALINA-ADMIN on 8/25/20.
//  Copyright © 2020 CATALINA-ADMIN. All rights reserved.
//

import UIKit
import CoreData

class ShowTrello: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    //var zero = 0
    var correctSection = 0
    var idBoard = UUID()
    var tableView = UITableView()
    var groups = [Group]()
    var board = [Board]()
    //var datePicker:UIDatePicker = UIDatePicker()
    let toolBar = UIToolbar()
    //var groupIndex = Int()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.dragDelegate = self
        collectionView.dropDelegate = self
        collectionView.dragInteractionEnabled = true
        let nib = UINib(nibName: "CellCollection", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "CellCollection")
        getData()
        UpdateSizeBoard(with: collectionView.bounds.size)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "trellodidappear"), object: nil) //,userInfo:)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        UpdateSizeBoard(with: size)
    }
    
    func UpdateSizeBoard(with size: CGSize){
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        layout.itemSize = CGSize(width: collectionView.frame.width - 40, height: size.height * 0.8)
    }
    
    func getData() {
        let request = NSFetchRequest<Board>(entityName: "Board")
        request.predicate = NSPredicate(format: "boardID = %@", idBoard as CVarArg)
        if let boardData = try? context.fetch(request) {
            board = boardData
            groups = board[0].haveGroups?.allObjects as! [Group]
            groups = groups.sorted(by: {$1.timeCreate > $0.timeCreate})
            collectionView.reloadData()
        }
    }
    
    func addNewGroup() {
        var groupName = String()
        let alertController = UIAlertController(title: "Add New Group", message: "Please enter name of the group", preferredStyle: .alert)
        let addAction = UIAlertAction(title: "Add", style: .default) { (_) in
            groupName = (alertController.textFields![0] as UITextField).text! as String
            if groupName != "" {
                let newGroup = Group(context: self.context)
                newGroup.groupID = UUID()
                newGroup.groupName = groupName
                newGroup.numOfTask = 0
                let date = Date()
                let timeInterval = date.timeIntervalSince1970
                newGroup.timeCreate = Int32(timeInterval)
                let request = NSFetchRequest<Board>(entityName: "Board")
                request.predicate = NSPredicate(format: "boardID = %@", self.idBoard as CVarArg)
                do {
                    self.board = try self.context.fetch(request)
                    newGroup.section = self.board[0].numOfGroup
                    newGroup.belongToBoard = self.board[0]
                    self.board[0].addToHaveGroups(newGroup)
                    self.board[0].numOfGroup = self.board[0].numOfGroup + 1
                    do {
                        try self.context.save()
                        self.getData()
                        DispatchQueue.main.async {
                            self.collectionView.scrollToItem(at: IndexPath(row: 0, section: self.groups.count), at: .right, animated: false)
                        }
                        print("Save Success")
                    } catch {
                        print("Save Fail")
                    }
                    
                }
                catch {
                    print("Error = \(error.localizedDescription)")
                }
                self.collectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .left, animated: true)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        alertController.addTextField { (textField) in
            textField.placeholder = "New Group"
        }
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
    func datePicker() {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        
        let alert = UIAlertController(title: "\n\n\n\n\n\n\n\n\n\n\n", message: nil, preferredStyle: .actionSheet)
        alert.view.addSubview(datePicker)
        
//        datePicker.makeConstraints { (make) in
//            make.centerX.equalTo(alert.view)
//            make.top.equalTo(alert.view).offset(8)
//        }
        
        let ok = UIAlertAction(title: "OK", style: .default) { (action) in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
            let dateString = dateFormatter.string(from: datePicker.date) + ":00"
            print(dateString)
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
}
///
extension ShowTrello: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cellCollection = collectionView.dequeueReusableCell(withReuseIdentifier: "CellCollection", for: indexPath) as? CellCollection {
                if indexPath.section == groups.count  {
                    cellCollection.idBoardContain = idBoard
                    //cellCollection.section = indexPath.section
                    cellCollection.clickAddGroup = {
                        self.addNewGroup()
                    }
                    cellCollection.setData(0, true)
                    return cellCollection
                }
                else {
                    if (self.groups.count > cellCollection.section) {
                        cellCollection.idGroup = self.groups[indexPath.section].groupID!
                        cellCollection.groupName = self.groups[indexPath.section].groupName!
                    }
                    cellCollection.setData(groups.count, false)
                    cellCollection.clickAddGroup = {
                        self.addNewGroup()
                    }
                    cellCollection.clickAddtask = {
                        self.getData()
                    }
                    cellCollection.clickMoreTask = {
                        let vc = MoreTaskSetting()
                        vc.chooseTime = {
                            self.datePicker()
                        }
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                    cellCollection.scrollGroup = { i in
                        collectionView.scrollToItem(at: IndexPath(row: 0, section: indexPath.section + i), at: .right, animated: true)
                    }
                }
                return cellCollection
            }
            return UICollectionViewCell()
        }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return groups.count + 1
    }
}
///
extension ShowTrello : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 3*collectionView.frame.width/4, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.00000009
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.00000009
    }
}

extension ShowTrello: UICollectionViewDragDelegate {
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        return [UIDragItem]()
    }
}

extension ShowTrello: UICollectionViewDropDelegate {
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        
    }
}
