//
//  ViewController.swift
//  TestProtocolCastCrash
//
//  Created by Billy Chan on 8/16/18.
//  Copyright © 2018 Billy Chan. All rights reserved.
//

import UIKit

//  Exmaple of protocol where clause crash
//  Related link: https://stackoverflow.com/questions/50913244/swift-protocol-with-where-self-clause
class ViewController: UIViewController {
    let viewController: UIViewController = Something()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.viewController.view)
        if let castProtocol = self.viewController as? SomeProtocol {
            //  If uncomment the print, seg-fault will occur.
//            print(String(describing: castProtocol))
//            print(String(describing: castProtocol.someFunction))
            
            //  Crash at this line
            castProtocol.someFunction()
        }
    }
}

protocol SomeProtocol where Self: UIViewController {
    func someFunction()
}

class Something: UIViewController, SomeProtocol {
    func someFunction() {
        print("desc = \(self.description)")
    }
}
