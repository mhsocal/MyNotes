//
//  ViewController.swift
//  MyNotes
//
//  Created by Mike Holstein on 10/29/18.
//  Copyright © 2018 Mike Holstein. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    var notesData:[String] = []
    
    @IBOutlet weak var notesTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notesTable.dataSource=self
        self.title="Mike's Notes"
        self.navigationController?.navigationBar.prefersLargeTitles=true
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNote))
        self.navigationItem.rightBarButtonItem=addButton
        self.navigationItem.leftBarButtonItem=editButtonItem
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        notesTable.setEditing(editing, animated: animated)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        notesData.remove(at: indexPath.row)
        notesTable.deleteRows(at: [indexPath], with: .fade)
    }
    
    @objc func addNote(){
        if notesTable.isEditing{return}
        
        let noteText:String="Note \(notesData.count+1)"
        notesData.insert(noteText, at: 0)
        
        let notesPath:IndexPath=IndexPath(row: 0, section: 0)
        notesTable.insertRows(at: [notesPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let thisCell:UITableViewCell=tableView.dequeueReusableCell(withIdentifier: "noteCell")!
        thisCell.textLabel?.text=notesData[indexPath.row]
        return thisCell
    }
    
}

