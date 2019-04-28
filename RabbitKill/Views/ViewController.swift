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

    @IBOutlet weak var bestScorelabel: UILabel!
    @IBOutlet weak var bestp1label: UILabel!
    @IBOutlet weak var bestp2label: UILabel!
    @IBOutlet weak var bestp3label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if (SalvaParametri.leggiParametro(nomeParametro: "best") == ""){
            bestScorelabel.text = "none"
        } else {
            bestScorelabel.text = SalvaParametri.leggiParametro(nomeParametro: "best")
        }
        if (SalvaParametri.leggiParametro(nomeParametro: "first") == ""){
            bestp1label.text  = "free"
        } else {
            bestp1label.text  = SalvaParametri.leggiParametro(nomeParametro: "first")
        }
        if (SalvaParametri.leggiParametro(nomeParametro: "second") == ""){
            bestp2label.text  = "free"
        } else {
            bestp2label.text  = SalvaParametri.leggiParametro(nomeParametro: "second")
        }
        if (SalvaParametri.leggiParametro(nomeParametro: "third") == ""){
            bestp3label.text  = "free"
        } else {
            bestp3label.text  = SalvaParametri.leggiParametro(nomeParametro: "third")
        }
        // Do any additional setup after loading the view.


    }

}

