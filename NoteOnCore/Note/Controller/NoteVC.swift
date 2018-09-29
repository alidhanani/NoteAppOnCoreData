//
//  NoteVC.swift
//  NoteOnCore
//
//  Created by Nerd Mac Admin on 29/09/2018.
//  Copyright © 2018 Nerd Mac Admin. All rights reserved.
//

import UIKit

class NoteVC: UIViewController {
    
    @IBOutlet weak var txtMsg: UITextView!
    var Position: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        NoteService.shared.GetParticularMessage(Position: Position) { (title, msg) in
            self.title = title
            self.txtMsg.text = msg
        }
    }
    
    @IBAction func btnSave() {
        NoteService.shared.updateNotes(Position: Position, Message: txtMsg.text) {
            AlertService.shared.ShowMessage(Title: "Success", Message: "Saved", View: self)
        }
    }
    
    @IBAction func GoBack() {
        self.navigationController?.popViewController(animated: true)
    }

}
