//
//  NoteService.swift
//  NoteAppCore
//
//  Created by Nerd Mac Admin on 29/09/2018.
//  Copyright © 2018 Nerd Mac Admin. All rights reserved.
//

import Foundation
import CoreData

class NoteService {
    
    static let shared = NoteService()
    init() {
    }
    
    let persistanceManager = PersistanceManager.shared
    var notes = [Note]()
    
    // Create User
    func CreateUser(Title title: String, Message msg: String, completion: @escaping ()->()) {
        let notes = Note(context: persistanceManager.context)
        notes.title = title
        notes.message = msg
        persistanceManager.save()
        completion()
    }
    
    func GetParticularMessage(Position num: Int, completion: @escaping (String, String)->()) {
        completion(notes[num].title, notes[num].message)
    }
    
    func printNotes(compeltion: @escaping ([String], [String]) -> ()) {
        let notes = persistanceManager.fetch(Note.self)
        self.notes = notes
        var title: [String] = []
        var msg: [String] = []
        notes.forEach { (note) in
            print(note.title)
            print(note.message)
            title.append(note.title)
            msg.append(note.message)
            compeltion(title, msg)
        }
    }
    
//    func getUser() {
//        let notes = persistanceManager.fetch(Notes.self)
//        self.notes = notes
//        printNotes()
//    }
    
    func updateNotes(Position num: Int, Message msg: String, completion: @escaping ()->()) {
        let firstNote = notes[num]
        firstNote.message = msg
        persistanceManager.save()
        completion()
    }
    
    func DeleteUser(Position num: Int, completion: @escaping ()->()) {
        let firstNote = notes[num]
        persistanceManager.context.delete(firstNote)
        persistanceManager.save()
        completion()
    }
}
