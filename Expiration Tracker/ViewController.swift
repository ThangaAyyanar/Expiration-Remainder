//
//  ViewController.swift
//  Expiration Tracker
//
//  Created by Thanga Ayyanar A on 03/05/19.
//  Copyright © 2019 Thanga Ayyanar A. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "Expiration Tracker"
        
        var values = [ItemWithDate]()
        
        for _ in 0...5 {
        
            values.append(ItemWithDate(value: "Hello", description: "Hello world", expirationDate: "dummy expiration data"))
        }
        self.navigationController?.pushViewController(ItemViewController.init(values: values), animated: true)
    }


}

