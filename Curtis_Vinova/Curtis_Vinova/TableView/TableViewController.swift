//
//  TableViewController.swift
//  Curtis_Vinova
//
//  Created by CATALINA-ADMIN on 8/17/20.
//  Copyright © 2020 CATALINA-ADMIN. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    var indexNow = 0
    var nameNow = ""
    var person_name = [String]()
    var person_dob = [String]()
    var person_company = [String]()
    var person_address = [String]()
    var person_founded = [String]()
    var person_co_founders = [[String]]()
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ViewCell", bundle: nil), forCellReuseIdentifier: "ViewCell")
        tableView.isEditing = true
        self.title = "Famous People"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return person_name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ViewCell") as? ViewCell {
            cell.lblName.text = person_name[indexPath.row]
            let dataPass = "Date of birth: \(self.person_dob[indexPath.row]) \nCompany: \(self.person_company[indexPath.row]) \nAddress: \(self.person_address[indexPath.row]) \nFounded: \(self.person_founded[indexPath.row]) \nCo-founders: \(self.person_co_founders[indexPath.row][0]) +  \(self.person_co_founders[indexPath.row][1])"
            cell.clickDetail = {
                let vc = DetailTableView()
                vc.setData(nameString: self.person_name[indexPath.row], detailInformation: dataPass)
                self.navigationController?.pushViewController(vc, animated: true)
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func parsePerson() {
        if let path = Bundle.main.path(forResource: "example", ofType: "json") {
            do {
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                  let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                  if let result = jsonResult as? [Any] {
                    for i in 0..<result.count{
                        if let temp = result[i] as? Dictionary<String, Any>{
                            //person[i].name = "STT: \(i+1)"
                            if let name = temp["name"] as? String {
                                person_name.append(name)
                            } else {person_name.append("No name info")}
                            if let dob = temp["dob"] as? String {
                                person_dob.append(dob)
                            } else {person_dob.append("No dob info")}
                            if let company = temp["company"] as? String {
                                person_company.append(company)
                            } else {person_company.append("No company info")}
                            if let address = temp["address"] as? String {
                                person_address.append(address)
                            } else {person_address.append("No address info")}
                            if let founded = temp["founded"] as? String {
                                person_founded.append(founded)
                            } else {person_founded.append("No founded info")}
                            if let co_founders = temp["co-founders"] as? [String] {
                                person_co_founders.append(co_founders)
                            } else {person_co_founders.append(["","No co-founders info\n"])}
                            }
                        }
                    }
              } catch {print("Error")}
        }
        let nameList = ["John Paper","Marrie Currie","Michael Jackson","Oprah Winfrey", "Leonardo DiCaprio", "Jerry Seinfeld", "Steven Spielberg", "Spice Girls", "Harrison Ford", "Robin Williams"]
        let dobList = ["20-2-1952","30-8-1995","31-1-1978","15-6-2000", "5-9-1956", "20-11-2001", "25-6-1973", "2-9-1995", "21-2-1996", "18-7-1991"]
        let companyList = ["Apple","Sony","Canon","Microsoft", "Lego", "Daimler (Mercedes-Benz)", "BMW Group", "Google", "The Walt Disney Company", "Rolex"]
        let addressList = ["1607 23rd Street NW, Washington, DC 20008","664 Dickens Road, Lilburn, Georgia 30047","9520 Faires Farm Road, Charlotte, NC 28213","2312 Dorrington Dr., Dallas, TX 75228", "2026 Scott Street, Hollywood, FL 33020", "318 Canino Road, Houston, TX 77076", "7280 N. Caldwell Avenue, Niles, IL 60714", "4761 Industrial Pkwy, Indianapolis, IN 46226", "26050 Kay Ave., Hayward, CA 94545", "1350 Red Rock Street, Las Vegas, NV 89146"]
        let foundedList = ["23-4-1952, 4303 Fittro Street","30-8-1976, 1408 Holden Street","20-10-1998, 577 College Street","30-1-1999, 4566 Hope Street", "8-3-1975 752 Kinney Street", "30-4-1923, 1832 Taylor Street", "20-6-1965, 1057 Airplane Avenue", "15-2-1989, 1998 Summit Street", "14-3-1976, 398 Millbrook Road", "1-1-1982, 2502 Buck Drive"]
        let co_foundersList = [["Marilyn Monroe","Abraham Lincoln"],
                               ["Nelson Mandela","Cristiano Ronaldo"],
                               ["Simon Bolivar","Marilyn Monroe"],
                               ["Simon Bolivar","Lech Walesa"],
                               ["Nelson Mandela","Abraham Lincoln"],
                               ["Cristiano Ronaldo","Tim Berners Lee"],
                               ["Lech Walesa","Shakira"],
                               ["Shakira","Marilyn Monroe"],
                               ["Simon Bolivar","Abraham Lincoln"],
                               ["Marilyn Monroe","Nelson Mandela"],
                               ["Tim Berners Lee","Shakira"]]
        while person_name.count < 100 {
            person_name.append(nameList.randomElement()!)
            person_company.append(companyList.randomElement()!)
            person_dob.append(dobList.randomElement()!)
            person_address.append(addressList.randomElement()!)
            person_founded.append(foundedList.randomElement()!)
            person_co_founders.append(co_foundersList.randomElement()!)
        }
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (indexPath.row % 2 == 0)
        {
            cell.backgroundColor = UIColor.black
        }
        else
        {
            cell.backgroundColor = UIColor.black
        }
        cell.layer.cornerRadius = cell.layer.frame.size.height/5.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        parsePerson()
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        struct Temp {
            var tempName = String()
            var tempDob = String()
            var tempAddress = String()
            var tempCompany = String()
            var tempFounded = String()
            var tempCo_founders = [String]()
        }
        var temp = Temp()
        temp.tempName = person_name[sourceIndexPath.row]
        temp.tempDob = person_dob[sourceIndexPath.row]
        temp.tempCompany = person_company[sourceIndexPath.row]
        temp.tempAddress = person_address[sourceIndexPath.row]
        temp.tempFounded = person_founded[sourceIndexPath.row]
        temp.tempCo_founders = person_co_founders[sourceIndexPath.row]
        person_name[sourceIndexPath.row] = person_name[destinationIndexPath.row]
        person_dob[sourceIndexPath.row] = person_dob[destinationIndexPath.row]
        person_company[sourceIndexPath.row] = person_company[destinationIndexPath.row]
        person_address[sourceIndexPath.row] = person_address[destinationIndexPath.row]
        person_founded[sourceIndexPath.row] = person_founded[destinationIndexPath.row]
        person_co_founders[sourceIndexPath.row] = person_co_founders[destinationIndexPath.row]
        person_name[destinationIndexPath.row] = temp.tempName
        person_dob[destinationIndexPath.row] = temp.tempDob
        person_company[destinationIndexPath.row] = temp.tempCompany
        person_address[destinationIndexPath.row] = temp.tempAddress
        person_founded[destinationIndexPath.row] = temp.tempFounded
        person_co_founders[destinationIndexPath.row] = temp.tempCo_founders
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            person_name.remove(at: indexPath.row)
            person_dob.remove(at: indexPath.row)
            person_company.remove(at: indexPath.row)
            person_address.remove(at: indexPath.row)
            person_founded.remove(at: indexPath.row)
            person_co_founders.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .middle)
            tableView.endUpdates()
        }
    }
    
    
}
