//
//  01_Remove_Duplicates_from_Sorted_Array.swift
//  leetCode
//
//  Created by WEN-HSUAN TUNG on 2021/8/28.
//

import Foundation
class Solution2 {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var outputNums : [String] = []
        for i in nums {
            if nums.firstIndex(of:i) != nil {
                outputNums.append("_")
            } else {
                outputNums.append("\(i)")
            }
        }
        
        let outputMap = outputNums.compactMap{ str in Int(str) }
        outputNums.sorted(by:<)
        print(outputNums)
        return outputNums.count
    }
}
