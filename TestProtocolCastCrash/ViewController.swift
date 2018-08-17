//
//  ViewController.swift
//  TestProtocolCastCrash
//
//  Created by Billy Chan on 8/16/18.
//  Copyright © 2018 Billy Chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let viewController: UIViewController = Something()
    let safeViewController: UIViewController = SafeSomething()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let castProtocol = self.viewController as SomeProtocol
//        print("desc: \(self.viewController.description)")
//        castProtocol.someFunction()
        self.view.addSubview(self.safeViewController.view)
        if let safeCastProtocol = self.safeViewController as? SomeProtocol2 {
            safeCastProtocol.someFunction(safeSelf: self.safeViewController)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

protocol SomeProtocol2 where Self: UIViewController {
    func someFunction<SelfType: UIViewController>(safeSelf: SelfType)
}
class SafeSomething: UIViewController, SomeProtocol2 {
    func someFunction<SelfType: UIViewController>(safeSelf: SelfType) {
        print("desc = \(safeSelf.description)")
    }
}
