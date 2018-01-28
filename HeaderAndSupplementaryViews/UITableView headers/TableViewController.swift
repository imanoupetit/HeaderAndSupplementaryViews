//
//  TableViewController.swift
//  HeaderAndSupplementaryViews
//
//  Created by Imanou on 28/01/2018.
//  Copyright © 2018 Imanou. All rights reserved.
//

import UIKit

struct Constants {
    static let tableSectionHeaderIdentifier1 = "TableSectionHeaderViewIdentifier1"
    static let tableSectionHeaderIdentifier2 = "TableSectionHeaderViewIdentifier2"
    static let tableViewCellIdentifier = "TableViewCell"
}

class TableViewController: UITableViewController {
    
    let dataArray = [[1, 2, 3], [4, 5], [6, 7, 8]]
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        // Register section header views
        let nib = UINib(nibName: "TableSectionHeaderView", bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: Constants.tableSectionHeaderIdentifier1)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: Constants.tableSectionHeaderIdentifier2)
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // Documentation: This method only works correctly when `tableView(_:heightForHeaderInSection:)` is also implemented
        switch section {
        case let value where value % 2 == 0:
            let sectionHeaderView = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: Constants.tableSectionHeaderIdentifier2) as! TableSectionHeaderView
            sectionHeaderView.titleLabel.text = "Section \(section)"
            sectionHeaderView.contentView.backgroundColor = .red
            return sectionHeaderView
        default:
            let sectionHeaderView = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: Constants.tableSectionHeaderIdentifier1) as! TableSectionHeaderView
            sectionHeaderView.titleLabel.text = "Section \(section)"
            sectionHeaderView.contentView.backgroundColor = .blue
            return sectionHeaderView
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.tableViewCellIdentifier, for: indexPath)
        cell.textLabel?.text = "\(dataArray[indexPath.section][indexPath.row])"
        return cell
    }
    
}
