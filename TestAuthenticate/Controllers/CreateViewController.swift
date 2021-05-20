//
//  CreateViewController.swift
//  TestAuthenticate
//
//  Created by Taof on 3/29/21.
//

import UIKit
import FirebaseFirestore

class CreateViewController: UIViewController {

    @IBOutlet weak var nameBookTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var publishTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        publishTextField.keyboardType = .phonePad
        
        descriptionTextView.layer.cornerRadius = 10
        descriptionTextView.layer.borderWidth = 1
        descriptionTextView.layer.borderColor = UIColor.lightGray.cgColor
        
        let saveButton = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(onSaveData))
        navigationItem.rightBarButtonItem = saveButton
    }
    
    @objc func onSaveData(){
        guard let name = nameBookTextField.text,
              let author = authorTextField.text,
              let description = descriptionTextView.text,
              let publish = publishTextField.text
        else {
            return
        }
        
        let book = Book(name: name, author: author, description: description, publishedAt: publish)
        
        let db = Firestore.firestore()
        
        db.collection("books").addDocument(data: book.dictionary)
    }

}
