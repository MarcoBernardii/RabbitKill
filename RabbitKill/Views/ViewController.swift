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
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Users", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        newUser.setValue("Shashikant", forKey: "username")
        newUser.setValue("1234", forKey: "password")
        newUser.setValue("1", forKey: "age")
        
        do {
            try context.save()
        } catch {
            print("Failed saving")
        }
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "username") as! String)
            }
            
        } catch {
            
            print("Failed")
        }
        SalvaParametri.salvaParametro(nomeParametro: "best", valore: "98394")
        bestScorelabel.text = SalvaParametri.leggiParametro(nomeParametro: "best")
        bestp1label.text  = SalvaParametri.leggiParametro(nomeParametro: "first")
        bestp2label.text  = SalvaParametri.leggiParametro(nomeParametro: "second")
        bestp3label.text  = SalvaParametri.leggiParametro(nomeParametro: "third")
        // Do any additional setup after loading the view.


    }

}

