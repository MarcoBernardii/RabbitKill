//
//  Player+CoreDataProperties.swift
//  RabbitKill
//
//  Created by Marco Bernardi on 05/04/2019.
//  Copyright © 2019 Marco Bernardi. All rights reserved.
//
//

import Foundation
import CoreData


extension Player {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Player> {
        return NSFetchRequest<Player>(entityName: "Player")
    }

    @NSManaged public var name: String?
    @NSManaged public var score: Int32

}
