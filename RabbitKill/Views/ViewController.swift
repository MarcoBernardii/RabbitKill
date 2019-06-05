//
//  ViewController.swift
//  RabbitKill
//
//  Created by Marco Bernardi on 02/04/2019.
//  Copyright © 2019 Marco Bernardi. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    
    @IBAction func btnGo(_ sender: Any) {
        if (lblNick.text != ""){
            
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let resultViewController = storyBoard.instantiateViewController(withIdentifier: "Second") as! SecondViewController
            SalvaParametri.salvaParametro(nomeParametro: "nscore", valore: lblNick.text!)
            self.present(resultViewController, animated:true, completion:nil)
            
        }
    }
    @IBOutlet weak var lblNick: UITextField!
    @IBAction func reset(_ sender: Any) {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        ReloadData()
    }
    @IBOutlet weak var bestScorelabel: UILabel!
    @IBOutlet weak var bestp1label: UILabel!
    @IBOutlet weak var bestp2label: UILabel!
    @IBOutlet weak var bestp3label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        ReloadData()
    
        // Do any additional setup after loading the view.


    }
    func ReloadData(){
        if (SalvaParametri.leggiParametro(nomeParametro: "best") == ""){
            bestScorelabel.text = "none"
        } else {
            bestScorelabel.text = SalvaParametri.leggiParametro(nomeParametro: "best")
        }
        let scoreboard = SalvaParametri.scoreBoardRead()
        if (scoreboard.0 == ""){
            bestp1label.text  = "free"
        } else {
            bestp1label.text  = scoreboard.3 + " " + scoreboard.0
        }
        if (scoreboard.1 == ""){
            bestp2label.text  = "free"
        } else {
            bestp2label.text  = scoreboard.4 + " " + scoreboard.1
        }
        if (scoreboard.2 == ""){
            bestp3label.text  = "free"
        } else {
            bestp3label.text  = scoreboard.5 + " " + scoreboard.2
        }
    }

}

