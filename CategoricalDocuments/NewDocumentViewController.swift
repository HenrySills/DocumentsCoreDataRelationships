//
//  NewDocumentViewController.swift
//  Expenses
//
//  Created by Henry Sills on 9/27/19.
//  Copyright © 2019 Shawn Moore. All rights reserved.
//

import UIKit

class NewDocumentViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var textTextField: UITextField!
    
    var category: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameTextField.delegate = self
        textTextField.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameTextField.resignFirstResponder()
        textTextField.resignFirstResponder()
    }
    
    @IBAction func saveDocument(_ sender: Any) {
        let name = nameTextField.text
        let text = textTextField.text ?? ""
        
        if let document = Document(name: name, text: text) {
            category?.addToRawDocuments(document)
            
            do {
                try document.managedObjectContext?.save()
                
                self.navigationController?.popViewController(animated: true)
            } catch {
                print("Document could not be created")
            }
        }
    }
}

extension NewDocumentViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
