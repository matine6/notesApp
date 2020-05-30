//
//  DetailViewController.swift
//  Заметки
//
//  Created by Alexandr Kulya on 21.05.2020.
//  Copyright © 2020 Alexandr Kulya. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Setup Veriables
    @IBOutlet weak var textView: UITextView!
    
    var textOfNote: UITextView = {
        let text = UITextView()
        text.font = .systemFont(ofSize: 20)
        return text
    }()
    
    var managerOfNote: ManagerOfNote!
    var currentIndexOfNote: Int!
    
    
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        let note = managerOfNote.notes[currentIndexOfNote]
        textView.text = note?.text
        textView.becomeFirstResponder()
    }
    

    
    // MARK: - Setup IBAction
    @IBAction func done() {
        let note = Note(text: textView.text)
        if textView.text != "" {
            managerOfNote.notes[currentIndexOfNote] = note
        } else {
            managerOfNote.notes[currentIndexOfNote] = nil
        }
        dismiss(animated: true)
    }
}
