//
//  ItemViewController.swift
//  Expiration Tracker
//
//  Created by Thanga Ayyanar A on 03/05/19.
//  Copyright © 2019 Thanga Ayyanar A. All rights reserved.
//

import UIKit

protocol Item {
    
    var value: String { get set }
    
    var description: String { get set }
}

struct ItemWithDate: Item{
    
    var value: String
    
    var description: String
    
    var expirationDate: String
}

class ItemViewController: UITableViewController {
    
    let values: [Item]
    let cellIdentifier = "cell"
    
    init(values: [Item]) {
        
        self.values = values
        super.init(style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return values.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        cell?.textLabel?.text = values[indexPath.row].value
        cell?.detailTextLabel?.text = values[indexPath.row].description
        return cell!
    }
    
}
