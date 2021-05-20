//
//  ListBookViewController.swift
//  TestAuthenticate
//
//  Created by Taof on 3/29/21.
//

import UIKit
import FirebaseFirestore

class ListBookViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var books: [Book] = []
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        getData("books")
    }
    
    func getData(_ collection: String){
        db.collection(collection).getDocuments { [weak self] (querySnapshot, err) in
            
            guard let strongSelf = self else { return }
            
            if let error = err {
                print("Có lỗi xảy ra khi lấy đọc tài liệu: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    
                    print("DocumentID: \(document.documentID)")
                    
                    if let name = document.data()["name"] as? String,
                       let author = document.data()["author"] as? String,
                       let description = document.data()["author"] as? String,
                       let publishAt = document.data()["publishedAt"] as? String {
                        
                        let book = Book(name: name, author: author, description: description, publishedAt: publishAt)
                        
                        strongSelf.books.append(book)
                    }
                }
                
                strongSelf.tableView.reloadData()
            }
        }
    }
    
}

extension ListBookViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell") as UITableViewCell
        let dataRow = books[indexPath.row]
        cell.textLabel?.text = dataRow.name
        cell.detailTextLabel?.text = dataRow.author + " | " + dataRow.publishedAt
        return cell
    }
}
