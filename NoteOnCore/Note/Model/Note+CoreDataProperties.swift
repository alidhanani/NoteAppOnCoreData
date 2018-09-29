//
//  Note+CoreDataProperties.swift
//  NoteOnCore
//
//  Created by Nerd Mac Admin on 29/09/2018.
//  Copyright © 2018 Nerd Mac Admin. All rights reserved.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var title: String
    @NSManaged public var message: String

}
