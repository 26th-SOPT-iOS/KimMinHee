//
//  ViewController.swift
//  iOS_2nd_Assignment_Calculator
//
//  Created by 김민희 on 26/04/2020.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        allButton.forEach({
            $0.layer.cornerRadius = $0.layer.bounds.size.width * 0.46
        })
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var allButton: [UIButton]!
}

