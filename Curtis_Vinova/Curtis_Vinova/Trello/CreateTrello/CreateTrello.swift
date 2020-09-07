//
//  CreateTrello.swift
//  Curtis_Vinova
//
//  Created by CATALINA-ADMIN on 8/23/20.
//  Copyright © 2020 CATALINA-ADMIN. All rights reserved.
//

import UIKit

class CreateTrello: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet var tabCollection: UICollectionView!
    @IBOutlet var pageCollection: UICollectionView!
    var boardColor = UIColor.white
    var taskColor = UIColor.blue
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.tabCollection{
            if indexPath.row == 0 {
                let cellBoard = tabCollection.dequeueReusableCell(withReuseIdentifier: "BoardCollection", for: indexPath) as! BoardCollection
                cellBoard.colorButton = self.boardColor
                cellBoard.clickBoard = {
                    if self.boardColor == UIColor.blue {
                        self.boardColor = UIColor.white
                        self.taskColor = UIColor.blue
                    }
                    self.tabCollection.reloadData()
                    self.pageCollection.scrollToItem(at: IndexPath(item: 0, section: 0), at: .right, animated: true)
                }
                return cellBoard
            }
            else {
                let cellTask = tabCollection.dequeueReusableCell(withReuseIdentifier: "TaskCollection", for: indexPath) as! TaskCollection
                cellTask.colorButton = self.taskColor
                cellTask.clickTask = {
                    if self.taskColor == UIColor.blue {
                        self.taskColor = UIColor.white
                        self.boardColor = UIColor.blue
                    }
                    self.tabCollection.reloadData()
                    self.pageCollection.scrollToItem(at: IndexPath(item: 1, section: 0), at: .left, animated: true)
                }
                return cellTask
            }
        }
        else {
            if indexPath.row == 0 {
                let cellPage = pageCollection.dequeueReusableCell(withReuseIdentifier: "PageCellAfter", for: indexPath) as! PageCellAfter
                cellPage.clickColor = {
                     self.navigationController?.pushViewController(ChooseColorBoard(), animated: true)
                }
                return cellPage
            }
            else {
                let cellPage = pageCollection.dequeueReusableCell(withReuseIdentifier: "PageCell", for: indexPath) as! PageCell
                cellPage.chooseColor = {
                    self.navigationController?.pushViewController(ColorTask(), animated: true)}
                cellPage.chooseBoard = {
                self.navigationController?.pushViewController(ChooseBoard(), animated: true)}
                cellPage.chooseGroup = {
                self.navigationController?.pushViewController(ChooseGroup(), animated: true)}
                return cellPage
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Create"
        self.navigationItem.backBarButtonItem?.title = "Exit"
        tabCollection.delegate = self
        tabCollection.dataSource = self
        pageCollection.delegate = self
        pageCollection.dataSource = self
        var nibTab = UINib(nibName: "BoardCollection", bundle: nil)
        tabCollection.register(nibTab, forCellWithReuseIdentifier: "BoardCollection")
        nibTab = UINib(nibName: "TaskCollection", bundle: nil)
        tabCollection.register(nibTab, forCellWithReuseIdentifier: "TaskCollection")
        var nibPage = UINib(nibName: "PageCellAfter", bundle: nil)
        pageCollection.register(nibPage, forCellWithReuseIdentifier: "PageCellAfter")
        nibPage = UINib(nibName: "PageCell", bundle: nil)
        pageCollection.register(nibPage, forCellWithReuseIdentifier: "PageCell")
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: screenWidth/2, height: screenHeight/10)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        tabCollection.collectionViewLayout = layout
        let layout1: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout1.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout1.itemSize = CGSize(width: screenWidth, height: 9*screenHeight/10)
        layout1.minimumInteritemSpacing = 0
        layout1.minimumLineSpacing = 0
        layout1.scrollDirection = .horizontal
        pageCollection.collectionViewLayout = layout1
    }
}
