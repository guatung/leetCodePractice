//
//  01_Remove_Duplicates_from_Sorted_Array.swift
//  leetCode
//
//  Created by WEN-HSUAN TUNG on 2021/8/28.
//

import Foundation
class Solution2 {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        
        var index:Int = 1
        
        for i in 1..<nums.count {
            if nums[i] != nums[i - 1] {
                nums[index] = nums[i]
                print(nums)
                index += 1
            }else{
                print(nums)
            }
        }
        
        return index
    }
}
