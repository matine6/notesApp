//
//  ManagerOfNote.swift
//  Заметки
//
//  Created by Alexandr Kulya on 21.05.2020.
//  Copyright © 2020 Alexandr Kulya. All rights reserved.
//

import Foundation

class ManagerOfNote {
    var notesCount : Int {
        return notes.count
    }
    var notes: [Int:Note] = [:]
    func add(note: Note) {
        notes[notes.count] = note
    }
}
