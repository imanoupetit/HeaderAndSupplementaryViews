//
//  TableSectionHeaderView.swift
//  HeaderAndSupplementaryViews
//
//  Created by Imanou on 28/01/2018.
//  Copyright © 2018 Imanou. All rights reserved.
//

import UIKit

/**
 A `UITableViewHeaderFooterView` subclass binded to a xib file
 Note that you must implement a contentView by yourself inside the xib file to make it work properly
 */
class TableSectionHeaderView: UITableViewHeaderFooterView {
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = .white
        }
    }
    
}

