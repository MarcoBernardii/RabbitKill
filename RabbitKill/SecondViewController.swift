//
//  ViewController.swift
//  RabbitKill
//
//  Created by Marco Bernardi on 02/04/2019.
//  Copyright © 2019 Marco Bernardi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var score: UILabel!
    var click = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        var timer:Timer?
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
        
        
    }
    func RandomButton(){
        let button = UIButton(type: UIButton.ButtonType.system) as UIButton
        let x = UIScreen.main.bounds.width
        let y = UIScreen.main.bounds.height
        let buttonWidth:CGFloat = 50
        let buttonHeight:CGFloat = 50
        let xPostion:CGFloat = CGFloat.random(in: 0 ..< x - buttonWidth)
        let yPostion:CGFloat = CGFloat.random(in: 0 ..< y - buttonHeight)
        button.frame = CGRect(x:xPostion, y:yPostion, width:buttonWidth, height:buttonHeight)
        button.setTitle("🐰", for: UIControl.State.normal)
        button.titleLabel!.font  = UIFont(name: ".SFUITEXT", size: 40)
        button.addTarget(self, action: #selector(ViewController.buttonAction(_:)), for: .touchUpInside)
        
        self.view.addSubview(button)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            button.removeFromSuperview()
        }
        
    }
    @objc func onTimerFires()
    {
        
        RandomButton()
    }
    @objc func buttonAction(_ sender:UIButton!)
    {
        click += 1
        score.text = String(click)
        sender.removeFromSuperview()
        print("Button tapped")
    }
    
    
}

