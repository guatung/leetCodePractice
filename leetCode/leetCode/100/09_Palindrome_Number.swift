//
//  09_Palindrome_Number.swift
//  leetCode
//
//  Created by WEN-HSUAN TUNG on 2021/8/27.
//

import Foundation

class palindrome{
    func isPalindrome(_ x: Int) -> Bool {
        if x>0 {
            let xToString = "\(x)"
            let reverseX = String(xToString.reversed())
            print("\(xToString) , \(reverseX)")
            if xToString == reverseX {
                return true
            }else{
                return false
            }
        }else{
            return false
        }
    }
}
