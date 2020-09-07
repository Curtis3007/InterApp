//
//  CellCollection.swift
//  Curtis_Vinova
//
//  Created by CATALINA-ADMIN on 8/26/20.
//  Copyright © 2020 CATALINA-ADMIN. All rights reserved.
//

import UIKit
import CoreData
import MobileCoreServices

class CellCollection: UICollectionViewCell, UIGestureRecognizerDelegate {
    var idGroup = UUID()
    let idGroupAdd = UUID()
    var groupName = String()
    var groupCount = 0
    var i = 0
    var section = -1
    var idBoardContain = UUID()
    var board = [Board]()
    var group = [Group]()
    var tasks = [Task]()
    var clickMoreTask: (() -> Void)?
    var reloadTrello: (() -> Void)?
    var clickAddGroup: (() -> ())?
    var clickAddtask: (() -> ())?
    var scrollGroup: ( (Int) -> Void)?
    @IBOutlet weak var tableView: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "GroupName", bundle: nil), forCellReuseIdentifier: "GroupName")
        tableView.register(UINib(nibName: "CellTable", bundle: nil), forCellReuseIdentifier: "CellTable")
        tableView.register(UINib(nibName: "AddSection", bundle: nil), forCellReuseIdentifier: "AddSection")
        tableView.register(UINib(nibName: "AddGroup", bundle: nil), forCellReuseIdentifier: "AddGroup")
        tableView.layer.cornerRadius = 30
        tableView.backgroundColor = UIColor.lightGray
        tableView.tableFooterView = UIView()
        tableView.dragDelegate = self
        tableView.dropDelegate = self
        tableView.dragInteractionEnabled = true
    }
}

extension CellCollection : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tasks.count > 0 {
            if section == 1 {
                return tasks.count
            }
        }
        if section == 1 {
             return 0
        }
        return 1
    }
        
    func numberOfSections(in tableView: UITableView) -> Int {
        if groupCount > 0 {
            return 3
        }
        return 1
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if groupCount > 0 {
            if tasks.count > 0 {
                if indexPath.section == 0 {
                    let cellTable = (tableView.dequeueReusableCell(withIdentifier: "GroupName", for: indexPath) as? GroupName)!
                    cellTable.lblGroupName.text = groupName
                    cellTable.backgroundColor = UIColor.darkGray
                    cellTable.clipsToBounds = true
                    return cellTable
                }
                else if indexPath.section == 1 {
                    let cellTable = (tableView.dequeueReusableCell(withIdentifier: "CellTable", for: indexPath) as? CellTable)!
                    cellTable.lblTaskName.text = tasks[indexPath.row].taskName
                    cellTable.backgroundColor = UIColor.clear
                    cellTable.clipsToBounds = true
                    return cellTable
                }
                else {
                    let cellTable = (tableView.dequeueReusableCell(withIdentifier: "AddSection", for: indexPath) as? AddSection)!
                    cellTable.backgroundColor = UIColor.clear
                    cellTable.clipsToBounds = true
                    cellTable.clickAddSection = {
                        var taskName = String()
                        let alertController = UIAlertController(title: "Add New Task", message: "Please enter name of the task", preferredStyle: .alert)
                        alertController.addTextField { (textField) in
                            textField.placeholder = "New Task"
                        }
                        let moreButton = UIAlertAction(title: "More", style: .destructive){(_) in
                            self.clickMoreTask?()
                        }
                        let addAction = UIAlertAction(title: "Add", style: .default) { (_) in
                            taskName = (alertController.textFields![0] as UITextField).text! as String
                            if taskName != "" {
                                let newTask = Task(context: self.context)
                                newTask.taskID = UUID()
                                newTask.taskName = taskName
                                newTask.taskDescription = ""
                                newTask.taskColor = "blue"
                                newTask.taskDate = nil
                                let date = Date()
                                let timeInterval = date.timeIntervalSince1970
                                newTask.timeCreate = Int32(timeInterval)
                                let request = NSFetchRequest<Group>(entityName: "Group")
                                    request.predicate = NSPredicate(format: "groupID = %@", self.idGroup as CVarArg)
                                do {
                                    self.group = try self.context.fetch(request)
                                    newTask.belongToGroup = self.group[0]
                                    self.group[0].addToHaveTasks(newTask)
                                    self.group[0].numOfTask = self.group[0].numOfTask + 1
                                    do {
                                        try self.context.save()
                                        self.clickAddtask?()
                                        print("Save Success")
                                    } catch {
                                        print("Save Fail")
                                    }
                                }
                                catch {
                                    print("Error = \(error.localizedDescription)")
                                }
                            }
                        }
                        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
                        alertController.addAction(moreButton)
                        alertController.addAction(addAction)
                        alertController.addAction(cancelAction)
                        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
                        }
                        return cellTable
                    }
            } else if tasks.count <= 0 {
                if indexPath.section == 0 {
                    let cellTable = (tableView.dequeueReusableCell(withIdentifier: "GroupName", for: indexPath) as? GroupName)!
                    cellTable.lblGroupName.text = groupName
                    cellTable.backgroundColor = UIColor.darkGray
                    cellTable.clipsToBounds = true
                    return cellTable
                }
                else {
                    let cellTable = (tableView.dequeueReusableCell(withIdentifier: "AddSection", for: indexPath) as? AddSection)!
                    cellTable.backgroundColor = UIColor.clear
                    cellTable.clipsToBounds = true
                    cellTable.clickAddSection = {
                        var taskName = String()
                        let alertController = UIAlertController(title: "Add New Task", message: "Please enter name of the task", preferredStyle: .alert)
                        alertController.addTextField { (textField) in
                            textField.placeholder = "New Task"
                        }
                        let moreButton = UIAlertAction(title: "More", style: .destructive){(_) in
                            self.clickMoreTask?()
                        }
                        let addAction = UIAlertAction(title: "Add", style: .default) { (_) in
                            taskName = (alertController.textFields![0] as UITextField).text! as String
                            if taskName != "" {
                                let newTask = Task(context: self.context)
                                newTask.taskID = UUID()
                                newTask.taskName = taskName
                                newTask.taskDescription = ""
                                newTask.taskColor = "blue"
                                newTask.taskDate = nil
                                let date = Date()
                                let timeInterval = date.timeIntervalSince1970
                                newTask.timeCreate = Int32(timeInterval)
                                let request = NSFetchRequest<Group>(entityName: "Group")
                                    request.predicate = NSPredicate(format: "groupID = %@", self.idGroup as CVarArg)
                                do {
                                    self.group = try self.context.fetch(request)
                                    newTask.belongToGroup = self.group[0]
                                    self.group[0].addToHaveTasks(newTask)
                                    self.group[0].numOfTask = self.group[0].numOfTask + 1
                                    do {
                                        try self.context.save()
                                        self.clickAddtask?()
                                        print("Save Success")
                                    } catch {
                                        print("Save Fail")
                                    }
                                }
                                catch {
                                    print("Error = \(error.localizedDescription)")
                                }
                            }
                        }
                        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
                        alertController.addAction(moreButton)
                        alertController.addAction(addAction)
                        alertController.addAction(cancelAction)
                        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
                        }
                        return cellTable
                }
            }
        } else  {
            let cellTable = (tableView.dequeueReusableCell(withIdentifier: "AddGroup", for: indexPath) as? AddGroup)!
            cellTable.backgroundColor = UIColor.darkGray
            cellTable.clipsToBounds = true
            cellTable.clickAddGroup = {
                self.clickAddGroup?()
            }
            return cellTable
        }
        return UITableViewCell()
    }
}

extension CellCollection : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 {
            return 80
        } else {
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if groupCount > 0 && tasks.count > 0 && indexPath.section == 1 {
            print("Enter the task!!!")
        }
    }

    func setData (_ groupcount: Int, _ isReload: Bool) {
        groupCount = groupcount
        if !isReload {
            let request = NSFetchRequest<Group>(entityName: "Group")
            request.predicate = NSPredicate(format: "groupID = %@", idGroup as CVarArg)
            do {
                group = try context.fetch(request)
                tasks = group[0].haveTasks?.allObjects as! [Task]
            }
            catch {
                print("Error = \(error.localizedDescription)")
            }
        }
        tableView.reloadData()
    }
}

extension CellCollection: UITableViewDragDelegate {
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        if let stringData = self.tasks[indexPath.row].taskName?.data(using: .utf8) {
            let itemProvider = NSItemProvider(item: stringData as NSData, typeIdentifier: kUTTypePlainText as String)
            let dragItem = UIDragItem(itemProvider: itemProvider)
            session.localContext = (board, indexPath, tableView)
            return [dragItem]
        }
        return [UIDragItem]()
    }
}

extension CellCollection: UITableViewDropDelegate {
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
        let destinationIndexPath: IndexPath
        if let indexPath = coordinator.destinationIndexPath {
            destinationIndexPath = indexPath
            print("aaaaaaaaaaa")
        } else {
            let row = tableView.numberOfRows(inSection: 1)
            destinationIndexPath = IndexPath(row: row - 1, section: 1)
        }
        if coordinator.proposal.operation == .move {
            if let item = coordinator.items.first {
                guard item is String else { return }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UITableViewDropProposal {
        return UITableViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
    }
}
