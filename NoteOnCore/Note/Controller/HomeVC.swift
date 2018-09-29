//
//  HomeVC.swift
//  NoteOnCore
//
//  Created by Nerd Mac Admin on 29/09/2018.
//  Copyright © 2018 Nerd Mac Admin. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    var Title: [String] = ["Title"]
    var Message: [String] = ["Message"]

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var Loading: UIActivityIndicatorView!
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        Title.removeAll()
//        Message.removeAll()
//        StopLoading()
//        ShowData()
//
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Title.removeAll()
        Message.removeAll()
        StopLoading()
        ShowData()
    }
    
    @IBAction func btnAdd() {
        AlertService.shared.AddingNote(view: self) { (ttf) in
            NoteService.shared.CreateUser(Title: ttf, Message: "", completion: {
                print("Added")
                self.Title.removeAll()
                self.Message.removeAll()
                self.ShowData()
                self.StopLoading()
            })
        }
    }
    
    func ShowData() {
        NoteService.shared.printNotes { (title, msg) in
            self.Title = title
            self.Message = msg
            self.tableView.reloadData()
        }
    }

}

extension HomeVC: Loading {
    
    func StartLoading() {
        Loading.isHidden = false
        //tableView.isHidden = true
        Loading.startAnimating()
    }
    
    func StopLoading() {
        Loading.isHidden = true
        Loading.stopAnimating()
        //tableView.isHidden = false
    }
    
}

extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Title.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? NoteTVC else {
            return UITableViewCell()
        }
        cell.Title.text = Title[indexPath.row]
        cell.Message.text = Message[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let NoteVC = self.storyboard?.instantiateViewController(withIdentifier: "Move") as! NoteVC
        NoteVC.Position = indexPath.row
        self.navigationController?.pushViewController(NoteVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            StartLoading()
            AlertService.shared.ShowMessageForDelete(Title: "Delete", Message: "Are you sure?", View: self) {
                NoteService.shared.DeleteUser(Position: indexPath.row, completion: {
                    self.Title.removeAll()
                    self.Message.removeAll()
                    self.ShowData()
                    self.StopLoading()
                })
            }
        }
    }

    
}
