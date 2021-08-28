//
//  ViewController.swift
//  leetCode
//
//  Created by WEN-HSUAN TUNG on 2021/8/24.
//

import UIKit

class ViewController: UIViewController {
    var Solution2_ = Solution2()
    var test = [1,2,2,2,6]
    override func viewDidLoad() {
        super.viewDidLoad()
        Solution2_.removeDuplicates(&test)
        
    }


}

