//
//  ViewController.swift
//  Go Trekkers
//
//  Created by Parth Patel on 01/04/24.
//

import UIKit

class HomeScreenVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for name in UIFont.familyNames {
          print(name)
          if let nameString = name as? String

        {

              print(UIFont.fontNames(forFamilyName: nameString))
          }
        }
    }


}

