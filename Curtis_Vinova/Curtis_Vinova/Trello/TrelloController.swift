//
//  TrelloController.swift
//  Curtis_Vinova
//
//  Created by CATALINA-ADMIN on 8/23/20.
//  Copyright © 2020 CATALINA-ADMIN. All rights reserved.
//

import UIKit
import CoreData

class TrelloController: UIViewController {

    @IBOutlet var tableBoardView: UITableView!
    @IBOutlet var btnCreate: UIButton!
    var board = [Board]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBAction func btnCreate(_ sender: Any) {
        self.navigationController?.pushViewController(CreateTrello(), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Trello"
        tableBoardView.delegate = self
        tableBoardView.dataSource = self
        tableBoardView.register(UINib(nibName: "CellBoard", bundle: nil), forCellReuseIdentifier: "CellBoard")
        fetchBoard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.btnCreate.layer.cornerRadius = self.btnCreate.layer.frame.size.width/2
        }
        fetchBoard()
        self.tableBoardView.reloadData()
    }

    func fetchBoard () {
        do{
            self.board = try context.fetch(Board.fetchRequest())
            DispatchQueue.main.async {
                self.tableBoardView.reloadData()
            }
        }
        catch {print("Fail")}
    }
}

extension TrelloController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return board.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CellBoard") as? CellBoard {
            let boardString = self.board[indexPath.row]
            cell.lblBoard.text = boardString.boardName
            return cell
        } else { return UITableViewCell()}
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ShowTrello()
        let boardString = self.board[indexPath.row]
        vc.idBoard = boardString.boardID!
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let actionDelete = UIContextualAction(style: .destructive, title: "Delete"){(action, view, completionHandler) in
            let boardToDelete = self.board[indexPath.row]
            self.context.delete(boardToDelete)
            do{
                try self.context.save()
            }
            catch{
            }
            self.fetchBoard()
        }
        return UISwipeActionsConfiguration(actions: [actionDelete])
    }
}

extension TrelloController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
