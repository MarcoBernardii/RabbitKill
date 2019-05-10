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
        var scoreboard = SalvaParametri.scoreBoardRead()
        if (scoreboard.0 == ""){
            bestp1label.text  = "free"
        } else {
            bestp1label.text  = scoreboard.0
        }
        if (scoreboard.1 == ""){
            bestp2label.text  = "free"
        } else {
            bestp2label.text  = scoreboard.1
        }
        if (scoreboard.2 == ""){
            bestp3label.text  = "free"
        } else {
            bestp3label.text  = scoreboard.2
        }
    }

}

