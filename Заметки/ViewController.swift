//
//  ViewController.swift
//  Заметки
//
//  Created by Alexandr Kulya on 21.05.2020.
//  Copyright © 2020 Alexandr Kulya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Setup Veriables
    var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    var managerOfNote: ManagerOfNote!
    
    
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        managerOfNote = ManagerOfNote()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    
    
    
    // MARK: - Setup AutoLayout
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
    }
    
    
    
    // MARK: - Setup IBAction
    @IBAction func add() {
        managerOfNote.add(note: Note.init(text: ""))
        let indexOfNote = managerOfNote.notes.count-1
        performSegue(withIdentifier: "Detail", sender: indexOfNote)
    }
    
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "Detail" else { return }
        guard let detailVC = segue.destination as? DetailViewController else { return }
        let indexOfNote = sender as? Int
        
        detailVC.currentIndexOfNote = indexOfNote
        detailVC.managerOfNote = managerOfNote
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexOfNote = indexPath.row
        performSegue(withIdentifier: "Detail", sender: indexOfNote)
    }
    
    
    
    // MARK: - Additional functions
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
            self.managerOfNote.notes.remove(at:self.managerOfNote.notes.index(forKey: indexPath.row)!)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
         return UISwipeActionsConfiguration.init(actions: [delete])
    }
}



    // MARK: - UITableViewDataSource
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return managerOfNote.notesCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        let note = managerOfNote.notes[indexPath.row]
        cell.setupText = note

        return cell
    }
    
    
}
