//
//  ViewController.swift
//  RabbitKill
//
//  Created by Marco Bernardi on 02/04/2019.
//  Copyright © 2019 Marco Bernardi. All rights reserved.
//

import UIKit
import Foundation

class SecondViewController: UIViewController {
    let x = UIScreen.main.bounds.width
    let y = UIScreen.main.bounds.height
    @IBOutlet weak var bbbbbbbbbbbbbbbb: UILabel!
    @IBOutlet weak var score: UILabel!
    var click = 0
    var timer:Timer?
    var placed = false
    var cicla = true
    var i = -1
    
    var speed = 10.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        giroTondo()
        
    }
    
    func RandomButton(){

        
        let button = UIButton(type: UIButton.ButtonType.system) as UIButton

        let buttonWidth:CGFloat = 100
        let buttonHeight:CGFloat = 100
        let xPostion:CGFloat = CGFloat.random(in: 0 ..< x - buttonWidth)
        let yPostion:CGFloat = CGFloat.random(in: 0 ..< y - buttonHeight)
        button.frame = CGRect(x:xPostion, y:yPostion, width:buttonWidth, height:buttonHeight)
        button.setTitle("🐰", for: UIControl.State.normal)
        button.titleLabel!.font  = UIFont(name: ".SFUITEXT", size: 100)
        button.addTarget(self, action: #selector(SecondViewController.buttonAction(_:)), for: .touchUpInside)
        self.view.addSubview(button)
        
        placed = true
        
    }
    @objc func giroTondo() {

        let time = Double(truncating: (pow(1.03, 20.0 - Double(self.i)) + 0.3) as NSNumber)
        print("----")
        print(i)
        print(time)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
            if (self.placed) {
                print("Perso")
                let loseButton = UIButton(type: UIButton.ButtonType.system) as UIButton
                loseButton.frame = CGRect(x:(self.x - 250)/2, y:(self.y - 100)/2, width:250, height:100)
                loseButton.setTitle("You Lost", for: UIControl.State.normal)
                loseButton.titleLabel!.font  = UIFont(name: ".SFUITEXT", size: 60)
                loseButton.addTarget(self, action: #selector(SecondViewController.losebuttonAction(_:)), for: .touchUpInside)
                self.view.addSubview(loseButton)
                
            } else {
                self.i += 1
                self.RandomButton()
                self.giroTondo()
            }
            
        }
        
    }
    
    func checkTopScores(score: Int){
        if ((SalvaParametri.leggiParametro(nomeParametro: "best")) == "") {
            SalvaParametri.salvaParametro(nomeParametro: "best", valore: String(self.i))
        } else {
            if (Int(SalvaParametri.leggiParametro(nomeParametro: "best"))! < self.i){
                SalvaParametri.salvaParametro(nomeParametro: "best", valore: String(self.i))
            }
        }
        
        if ((SalvaParametri.leggiParametro(nomeParametro: "first")) == "") {
            SalvaParametri.salvaParametro(nomeParametro: "first", valore: String(self.i))
        } else {
            if (Int(SalvaParametri.leggiParametro(nomeParametro: "first"))! < score){
                SalvaParametri.salvaParametro(nomeParametro: "first", valore: String(score))
            } else {
                if ((SalvaParametri.leggiParametro(nomeParametro: "second")) == "") {
                    SalvaParametri.salvaParametro(nomeParametro: "second", valore: String(score))
                } else {
                    if (Int(SalvaParametri.leggiParametro(nomeParametro: "second"))! < score){
                        SalvaParametri.salvaParametro(nomeParametro: "second", valore: String(score))
                    } else {
                        if ((SalvaParametri.leggiParametro(nomeParametro: "third")) == "") {
                            SalvaParametri.salvaParametro(nomeParametro: "third", valore: String(score))
                        } else {
                            if (Int(SalvaParametri.leggiParametro(nomeParametro: "third"))! < score){
                                SalvaParametri.salvaParametro(nomeParametro: "third", valore: String(score))
                            }
                        }
                    }
                }
            }
        }
        
    }
    @objc func losebuttonAction(_ sender:UIButton!)
    {
        let homeView = self.storyboard?.instantiateViewController(withIdentifier: "Main") as! ViewController
        self.navigationController?.pushViewController(homeView, animated: true)
    }
    @objc func buttonAction(_ sender:UIButton!)
    {
        placed = false
        sender.removeFromSuperview()
        print("Premuto")
        
    }
    
    
}

