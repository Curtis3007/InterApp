//
//  CalculatorViewController.swift
//  Curtis_Vinova
//
//  Created by CATALINA-ADMIN on 8/17/20.
//  Copyright © 2020 CATALINA-ADMIN. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    var result: Double = 0
    var first: Double = 0
    var second: Double = 0
    var text: String = ""
    var countDot: Int = 0
    var isPlus: Bool = false
    var isMinus: Bool = false
    var isMul: Bool = false
    var isDivise: Bool = false
    @IBOutlet var viewEqual: UIButton!
    @IBOutlet var label: UILabel!
    @IBOutlet var btnZero: UIButton!
    @IBOutlet var btnDot: UIButton!
    @IBOutlet var btnOne: UIButton!
    @IBOutlet var btnTwo: UIButton!
    @IBOutlet var btnThree: UIButton!
    @IBOutlet var btnFour: UIButton!
    @IBOutlet var btnFive: UIButton!
    @IBOutlet var btnSix: UIButton!
    @IBOutlet var btnSeven: UIButton!
    @IBOutlet var btnEight: UIButton!
    @IBOutlet var btnNine: UIButton!
    @IBOutlet var btnAC: UIButton!
    @IBOutlet var btnOpposite: UIButton!
    @IBOutlet var btnDivise100: UIButton!
    @IBOutlet var btnEqual: UIButton!
    @IBOutlet var btnPlus: UIButton!
    @IBOutlet var btnMinus: UIButton!
    @IBOutlet var btnMul: UIButton!
    @IBOutlet var btnDivise: UIButton!
    
    @IBAction func btnDot(_ sender: UIButton) {
        if countDot == 0{
            if text.count < 9 {
                text += "."
                label.text = text
                countDot += 1
            }
        }
    }
    
    @IBAction func btnZero(_ sender: UIButton) {
        if text.count < 9 {
            text += "0"
            label.text = text}
    }
    
    @IBAction func btnOne(_ sender: UIButton) {
        if text.count < 9 {
            text += "1"
            label.text = text}
    }
    
    @IBAction func btnTwo(_ sender: Any) {
        if text.count < 9 {
        text += "2"
            label.text = text}
    }
    
    @IBAction func btnThree(_ sender: Any) {
        if text.count < 9 {
        text += "3"
            label.text = text}
    }
    
    @IBAction func btnFour(_ sender: Any) {
        if text.count < 9 {
            text += "4"
            label.text = text}
    }
    
    @IBAction func btnFive(_ sender: Any) {
        if text.count < 9 {
        text += "5"
        label.text = text}
    }
    
    @IBAction func btnSix(_ sender: Any) {
        if text.count < 9 {
        text += "6"
        label.text = text}
    }
    
    @IBAction func btnSeven(_ sender: Any) {
        if text.count < 9 {
        text += "7"
        label.text = text}
    }
    
    @IBAction func btnEight(_ sender: Any) {
        if text.count < 9 {
        text += "8"
        label.text = text}
    }
    
    @IBAction func btnNine(_ sender: Any) {
        if text.count < 9 {
        text += "9"
        label.text = text}
    }
    
    @IBAction func btnPlus(_ sender: Any) {
        if (isPlus){
            second = Double(text) ?? 0
            first = first + second
            isPlus = false
            let temp = Int(first)
            text = String(first)
            if Double(temp) == first {
                text = String(temp)
            }
        }
        else if (isMinus){
            second = Double(text) ?? 0
            first = first - second
            isMinus = false
            let temp = Int(first)
            text = String(first)
            if Double(temp) == first {
                text = String(temp)
            }
        }
        else if (isMul){
            second = Double(text) ?? 0
            first = first * second
            isMul = false
            let temp = Int(first)
            text = String(first)
            if Double(temp) == first {
                text = String(temp)
            }
        }
        else if (isDivise && second != 0){
            second = Double(text) ?? 0
            first = first / second
            isDivise = false
            let temp = Int(first)
            text = String(first)
            if Double(temp) == first {
                text = String(temp)
            }
        }
//        else{
//
//        }
        first = Double(text) ?? 0
        isPlus = true
        text = ""
        label.text=""
    }
    
    @IBAction func btnMinus(_ sender: Any) {
        if (isPlus){
            second = Double(text) ?? 0
            first = first + second
            isPlus = false
            let temp = Int(first)
            text = String(first)
            if Double(temp) == first {
                text = String(temp)
            }
        }
        else if (isMinus){
            second = Double(text) ?? 0
            first = first - second
            isMinus = false
            let temp = Int(first)
            text = String(first)
            if Double(temp) == first {
                text = String(temp)
            }
        }
        else if (isMul){
            second = Double(text) ?? 0
            first = first * second
            isMul = false
            let temp = Int(first)
            text = String(first)
            if Double(temp) == first {
                text = String(temp)
            }
        }
        else if (isDivise && second != 0){
            second = Double(text) ?? 0
            first = first / second
            isDivise = false
            let temp = Int(first)
            text = String(first)
            if Double(temp) == first {
                text = String(temp)
            }
        }
        first = Double(text) ?? 0
        isMinus = true
        text = ""
        label.text=""
    }
    
    @IBAction func btnMul(_ sender: Any) {
        if (isPlus){
            second = Double(text) ?? 0
            first = first + second
            isPlus = false
            let temp = Int(first)
            text = String(first)
            if Double(temp) == first {
                text = String(temp)
            }
        }
        else if (isMinus){
            second = Double(text) ?? 0
            first = first - second
            isMinus = false
            let temp = Int(first)
            text = String(first)
            if Double(temp) == first {
                text = String(temp)
            }
        }
        else if (isMul){
            second = Double(text) ?? 0
            first = first * second
            isMul = false
            let temp = Int(first)
            text = String(first)
            if Double(temp) == first {
                text = String(temp)
            }
        }
        else if (isDivise && second != 0){
            second = Double(text) ?? 0
            first = first / second
            isDivise = false
            let temp = Int(first)
            text = String(first)
            if Double(temp) == first {
                text = String(temp)
            }
        }
        first = Double(text) ?? 0
        isMul = true
        text = ""
        label.text=""
    }
    
    @IBAction func btnDivise(_ sender: Any) {
        if (isPlus){
            second = Double(text) ?? 0
            first = first + second
            isPlus = false
            let temp = Int(first)
            text = String(first)
            if Double(temp) == first {
                text = String(temp)
            }
        }
        else if (isMinus){
            second = Double(text) ?? 0
            first = first - second
            isMinus = false
            let temp = Int(first)
            text = String(first)
            if Double(temp) == first {
                text = String(temp)
            }
        }
        else if (isMul){
            second = Double(text) ?? 0
            first = first * second
            isMul = false
            let temp = Int(first)
            text = String(first)
            if Double(temp) == first {
                text = String(temp)
            }
        }
        else if (isDivise && second != 0){
            second = Double(text) ?? 0
            first = first / second
            isDivise = false
            let temp = Int(first)
            text = String(first)
            if Double(temp) == first {
                text = String(temp)
            }
        }
        first = Double(text) ?? 0
        isDivise = true
        text = ""
        label.text=""
    }
    
    @IBAction func btnOppsite(_ sender: Any) {
        switch text[text.startIndex] == "-" {
            case true:
                text.remove(at: text.startIndex)
                text = String(text.prefix(9))
                label.text=text
            case false:
                text.insert("-", at: text.startIndex)
                text = String(text.prefix(9))
                label.text=text
        }
    }
    
    @IBAction func btnDivise100(_ sender: Any) {
        if let temp = Double(text){
            text = String(temp / 100)
            text = String(text.prefix(9))
            label.text=text
        }
    }
    
    @IBAction func btnAC(_ sender: Any) {
        result = 0
        first = 0
        second = 0
        text = ""
        countDot = 0
        isPlus = false
        isMinus = false
        isMul = false
        isDivise = false
        label.text=""
    }
    
    @IBAction func btnEqual(_ sender: Any) {
        second = Double(text) ?? 0
        if (isPlus){
            first = first + second
            isPlus = false
            let temp = Int(first)
            text = String(first)
            if Double(temp) == first {
                text = String(temp)
            }
            text = String(text.prefix(9))
            label.text = text
        }
        else if (isMinus){
            first = first - second
            isMinus = false
            let temp = Int(first)
            text = String(first)
            if Double(temp) == first {
                text = String(temp)
            }
            text = String(text.prefix(9))
            label.text = text
        }
        else if (isMul){
            first = first * second
            isMul = false
            let temp = Int(first)
            text = String(first)
            if Double(temp) == first {
                text = String(temp)
            }
            text = String(text.prefix(9))
            label.text = text
        }
        else if (isDivise && second != 0){
            first = first / second
            isDivise = false
            let temp = Int(first)
            text = String(first)
            if Double(temp) == first {
                text = String(temp)
            }
            text = String(text.prefix(9))
            label.text = text
        }
        else{
            text = String(text.prefix(9))
            label.text = text
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(listenTrello), name: NSNotification.Name("trellodidappear"), object: nil)
        // Do any additional setup after loading the view.
    }
    
    @objc func listenTrello(noti: Notification) {
        print("1")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UIDevice.current.orientation.isLandscape{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            }
        }
        
        btnZero.layer.cornerRadius = 30
        btnOne.layer.cornerRadius = btnOne.frame.size.height/2
        btnTwo.layer.cornerRadius = btnTwo.frame.size.height/2
        btnThree.layer.cornerRadius = btnThree.frame.size.height/2
        btnFour.layer.cornerRadius = btnFour.frame.size.height/2
        btnFive.layer.cornerRadius = btnFive.frame.size.height/2
        btnSix.layer.cornerRadius = btnSix.frame.size.height/2
        btnSeven.layer.cornerRadius = btnSeven.frame.size.height/2
        btnEight.layer.cornerRadius = btnEight.frame.size.height/2
        btnNine.layer.cornerRadius = btnNine.frame.size.height/2
        btnAC.layer.cornerRadius = btnAC.frame.size.height/2
        btnOpposite.layer.cornerRadius = btnOpposite.frame.size.height/2
        btnDivise100.layer.cornerRadius = btnDivise100.frame.size.height/2
        btnDot.layer.cornerRadius = btnDot.frame.size.height/2
        btnPlus.layer.cornerRadius = btnPlus.frame.size.height/2
        btnMinus.layer.cornerRadius = btnMinus.frame.size.height/2
        btnMul.layer.cornerRadius = btnMul.frame.size.height/2
        btnDivise.layer.cornerRadius = btnDivise.frame.size.height/2
        btnEqual.layer.cornerRadius = btnEqual.frame.size.height/2
    }

    override func viewDidDisappear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
        }
    }

}
