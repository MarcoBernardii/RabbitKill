//
//  Player+CoreDataClass.swift
//  RabbitKill
//
//  Created by Marco Bernardi on 05/04/2019.
//  Copyright © 2019 Marco Bernardi. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Player)
public class Player: NSManagedObject {
    override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
    super.init(entity: entity, insertInto: context)
}
