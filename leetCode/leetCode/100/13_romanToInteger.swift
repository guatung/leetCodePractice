//
//  13_romanToInteger.swift
//  leetCode
//
//  Created by WEN-HSUAN TUNG on 2021/8/27.
//

import Foundation
class Roman {
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
