//
//  01_easy_Two_Sum.swift
//  leetCode
//
//  Created by WEN-HSUAN TUNG on 2021/8/24.
//

import Foundation

class Solution {
    
    // 01_easy_Two_Sum
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
            var numberIndexDict = [Int:Int]()
            for (index, num) in nums.enumerated() {
                guard let pairedIndex = numberIndexDict[target - num] else {
                    numberIndexDict[num] = index
                    continue
                }
                print([pairedIndex, index])
                return [pairedIndex, index]
            }
            
            return [-1, -1]
        }
    // 07_reverse_integer
    func reverse(_ x: Int) -> Int {
            let input = abs(x)
            if Int(String(String(input).reversed()))! > Int(Int32.max) { return 0 }
            return x >= 0 ? Int(String(String(input).reversed()))! : Int(String(String(input).reversed()))! * (-1)
        }
    
    //09_Palindrome_Number
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
 
    //13_Roman_To_Integer
    func romanToInt(_ s: String) -> Int {
        
        let sToList = s.reversed().map { String($0) }
          var total : Int = 0
          print(sToList)
          var lastCharactor : String = "I"
          for i in sToList {
            
              switch i {
                  case "I" :
                    if lastCharactor == "I" {
                        total += 1
                    }else{
                        total -= 1
                    }
                  case "V" :
                    total += 5
                  case "X" :
                    if lastCharactor == "L" || lastCharactor == "C"  || lastCharactor == "M" {
                        total -= 10
                    }else{
                        total += 10
                    }
                  case "L" :
                    total += 50
                  case "C" :
                    if lastCharactor == "D" || lastCharactor == "M" {
                        total -= 100
                    }else{
                        total += 100
                    }
                  case "D" :
                    total += 500
                  case "M" :
                    total += 1000
                  default : print("error")
              }
            lastCharactor = i
          }
        print(total)
            return total
    }
}
