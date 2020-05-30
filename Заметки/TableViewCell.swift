//
//  TableViewCell.swift
//  Заметки
//
//  Created by Alexandr Kulya on 21.05.2020.
//  Copyright © 2020 Alexandr Kulya. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    var setupText: Note? {
        didSet {
            self.textLabel?.text = setupText?.text
        }
    }
}
