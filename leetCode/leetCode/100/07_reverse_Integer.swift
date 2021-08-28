//
//  07_reverse_Integer.swift
//  leetCode
//
//  Created by WEN-HSUAN TUNG on 2021/8/27.
//

import Foundation

class reserveNumber {
    func reverse(_ x: Int) -> Int {
            let input = abs(x)
            if Int(String(String(input).reversed()))! > Int(Int32.max) { return 0 }
            return x >= 0 ? Int(String(String(input).reversed()))! : Int(String(String(input).reversed()))! * (-1)
        }
}
