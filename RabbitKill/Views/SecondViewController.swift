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
    @IBOutlet var tempBar: UIView!
    @IBOutlet weak var labelScore: UILabel!
    let x = UIScreen.main.bounds.width
    let y = UIScreen.main.bounds.height
    var click = 0
    var timer:Timer?
    var placed = false
    var cicla = true
    var i = 0
    var button = UIButton(type: UIButton.ButtonType.system)
    var speed = 10.0
    var size = 100.0
    var backgroundImage: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backgroundImage = UIImageView(image: UIImage(named: "bg"))
        self.backgroundImage.contentMode = .scaleAspectFill
        self.view.insertSubview(self.backgroundImage, at: 0)
        giroTondo()
        
        
    }
    
    func RandomButton(){
        let buttonWidth:CGFloat = 100
        let buttonHeight:CGFloat = 100
        let xPostion:CGFloat = CGFloat.random(in: 0 ..< x - buttonWidth)
        let yPostion:CGFloat = CGFloat.random(in: 0 ..< y - buttonHeight)
        button.frame = CGRect(x:xPostion, y:yPostion, width:buttonWidth, height:buttonHeight)
        button.setTitle("🐰", for: UIControl.State.normal)
        button.titleLabel!.font  = UIFont(name: ".SFUITEXT", size: CGFloat(size))
        size =  size - 0.5
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
                self.checkTopScores(score: self.i - 1 )
                self.button.removeFromSuperview()
            } else {
                
                self.i += 1
                self.RandomButton()
                self.giroTondo()
            }
            
        }
        
    }
    
    func checkTopScores(score: Int){
        var bestscore:Int  = Int(SalvaParametri.leggiParametro(nomeParametro: "best"))!
        if (score  > bestscore){
            SalvaParametri.salvaParametro(nomeParametro: "best", valore: String(score))
        }
        let valori = SalvaParametri.scoreBoardRead()
        var first:Int = Int(valori.0)!
        var second:Int = Int(valori.1)!
        var third:Int = Int(valori.2)!
        var temp = 0
        var temp2 = 0
        if (score > first){
            temp = first
            first = score
            temp2 = second
            second = temp
            third = temp2
        } else if (score > second){
            temp = second
            second = score
            third = temp
        }  else if (score > third){
            third = score
        }
        SalvaParametri.scoreBoardSave(first: first, second: second, third: third)
        
    }
    @objc func losebuttonAction(_ sender:UIButton!)
    {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let resultViewController = storyBoard.instantiateViewController(withIdentifier: "Main") as! ViewController
        self.present(resultViewController, animated:true, completion:nil)

    }
    @objc func buttonAction(_ sender:UIButton!)
    {
        var label:Int = Int(labelScore.text!)!
        self.labelScore.text = String(label + 1)
        placed = false
        sender.removeFromSuperview()
        print("Premuto")
        
    }
    
    
}

