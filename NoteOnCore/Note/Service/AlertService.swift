//
//  AlertService.swift
//  NoteAppCore
//
//  Created by Nerd Mac Admin on 29/09/2018.
//  Copyright © 2018 Nerd Mac Admin. All rights reserved.
//

import Foundation
import UIKit

class AlertService {
    
    static let shared = AlertService()
    init() {
    }
    
    func AddingNote(view: UIViewController, completion: @escaping (String)->()) {
        let alert = UIAlertController(title: "Create Note", message: nil, preferredStyle: .alert)
        alert.addTextField { (tf) in
            tf.placeholder = "Title"
        }
        let action = UIAlertAction(title: "Create", style: .default, handler: { (_) in
            completion((alert.textFields?.first?.text)!)
        })
        alert.addAction(action)
        let actionNO = UIAlertAction(title: "Cancel", style: .destructive, handler: { (_) in
            alert.dismiss(animated: true, completion: nil)
        })
        alert.addAction(actionNO)
        view.present(alert, animated: true, completion: nil)

    }
    
    func ShowMessageWithWork(Title title: String, Message msg: String, View view: UIViewController, completion: @escaping ()->()) {
        if #available(iOS 10.0, *) {
            let alertController = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
            {
                (result : UIAlertAction) -> Void in
                completion()
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default)
            {
                (result : UIAlertAction) -> Void in
                print("Cancel")
                alertController.dismiss(animated: true, completion: nil)
            }
            alertController.addAction(okAction)
            alertController.addAction(cancelAction)
            view.present(alertController, animated: true, completion: nil)
        } else {
            let alertView = UIAlertView(title: title, message: msg, delegate: self, cancelButtonTitle: "OK")
            alertView.show()
        }
    }
    
    func ShowMessageWithWorkSave(Title title: String, Message msg: String, View view: UIViewController, completion: @escaping ()->()) {
        if #available(iOS 10.0, *) {
            let alertController = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
            {
                (result : UIAlertAction) -> Void in
                completion()
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default)
            {
                (result : UIAlertAction) -> Void in
                print("Cancel")
                view.navigationController?.popViewController(animated: true)
                alertController.dismiss(animated: true, completion: nil)
            }
            alertController.addAction(okAction)
            alertController.addAction(cancelAction)
            view.present(alertController, animated: true, completion: nil)
        } else {
            let alertView = UIAlertView(title: title, message: msg, delegate: self, cancelButtonTitle: "OK")
            alertView.show()
        }
    }
    
    func ShowMessage(Title title: String, Message msg: String, View view: UIViewController) {
        if #available(iOS 10.0, *) {
            let alertController = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
            {
                (result : UIAlertAction) -> Void in
                print("Ok")
            }
            alertController.addAction(okAction)
            view.present(alertController, animated: true, completion: nil)
        } else {
            let alertView = UIAlertView(title: title, message: msg, delegate: self, cancelButtonTitle: "OK")
            alertView.show()
        }
    }
    
    func ShowMessageForDelete(Title title: String, Message msg: String, View view: UIViewController, completion: @escaping ()->()) {
        if #available(iOS 10.0, *) {
            let alertController = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
            
            let okAction = UIAlertAction(title: "Delete", style: UIAlertAction.Style.destructive)
            {
                (result : UIAlertAction) -> Void in
                completion()
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default)
            {
                (result : UIAlertAction) -> Void in
                alertController.dismiss(animated: true, completion: nil)
            }
            alertController.addAction(okAction)
            alertController.addAction(cancelAction)
            view.present(alertController, animated: true, completion: nil)
        } else {
            let alertView = UIAlertView(title: title, message: msg, delegate: self, cancelButtonTitle: "OK")
            alertView.show()
        }
    }
    
}
