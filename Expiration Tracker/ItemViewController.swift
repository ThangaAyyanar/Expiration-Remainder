//
//  ItemViewController.swift
//  Expiration Tracker
//
//  Created by Thanga Ayyanar A on 03/05/19.
//  Copyright © 2019 Thanga Ayyanar A. All rights reserved.
//

import UIKit

struct Item{
    
    var value: String
    
    var description: String
    
    var expirationDate: String
}

var itemsArray:[String] = []

class ItemViewController: UITableViewController {
    
    let values: [Item]
    let cellIdentifier = "cell"
    
    init(values: [Item]) {
        
        self.values = values
        super.init(style: .plain)
        tableView.register(ItemViewTableCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return values.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ItemViewTableCell
        cell?.setValue(item: values[indexPath.row])
        return cell!
    }
    
}

class ItemViewTableCell: UITableViewCell {
    
    lazy var itemName: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var expirationData: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: .default, reuseIdentifier: "cell1")
        
        self.contentView.addSubview(itemName)
        self.contentView.addSubview(expirationData)
        
        activateConstraints()
    }
    
    func activateConstraints() {
        
//        itemName.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0).isActive = true
        NSLayoutConstraint(item: itemName, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: itemName, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: itemName, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: itemName, attribute: .width, relatedBy: .equal, toItem: self.contentView, attribute: .width, multiplier: 0.6, constant: self.contentView.frame.width).isActive = true
        
        NSLayoutConstraint(item: expirationData, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: expirationData, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: expirationData, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: expirationData, attribute: .leading, relatedBy: .equal, toItem: itemName, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
    }
    
    func setValue(item: Item) {
        
        itemName.text = item.value
        expirationData.text = item.expirationDate
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
