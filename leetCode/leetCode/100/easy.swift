//
//  01_easy_Two_Sum.swift
//  leetCode
//
//  Created by WEN-HSUAN TUNG on 2021/8/24.
//

// -----------------------------------------
// 01-10: 1 , 7 , 9
// 11-20: 13, 14
// 21-30: 26,
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
    
    //14_Longest Common Prefix
    func longestCommonPrefix(_ strs: [String]) -> String {
        // 1 先找出陣列中最短的字母，確保最短的比對次數
        // 2 把陣列第一個取出並將所有字母切割
        // 3 將每一個strs裡的string取出後array切割
        // 4 比對每一個array裡的同序位單字，同就繼續新增，不同就先return
        
        var shortest : Int = 0
        if(strs.count == 0 || strs[0].count == 0) {
            return ""
        }else if strs.count==1 {
            return strs[0]
        }else{
            shortest = getStrsItemLength(strs)
        }
        
        if shortest == 0 {
            return ""
        }
        
        var prefixString : String = ""
        let prefix = Array(strs[0])
        for i in 0...shortest-1{
            let prefixAlpha = prefix[i]
            for x in 1...strs.count-1{
                let matchItem = Array(strs[x])
                if matchItem[i] == prefixAlpha {
                    if x == strs.count-1 {
                        prefixString = prefixString + "\(prefix[i])"
                    }
                }else{
                    return prefixString
                }
            }
        }
        return prefixString
    }
    
    func getStrsItemLength(_ strs: [String]) -> Int{
        var itemLengthList : [Int] = []
        for i in strs {
            itemLengthList.append(i.count)
        }
        itemLengthList.sort(by: <)
        return itemLengthList[0]
    }
    
    /*
     other better answer : 14 Longest Common Prefix
     func longestCommonPrefix(_ strs: [String]) -> String {
     if(strs.count == 0) {
     return "";
     }
     
     var output = strs[0];
     
     for i in 1..<strs.count {
     output = findCommonPrefix(output, strs[i]);
     print("output:\(output) i:\(i)")
     }
     print(output)
     return output;
     }
     
     func findCommonPrefix(_ str1: String, _ str2: String) -> String {
     let chars1 = Array(str1)
     let chars2 = Array(str2)
     var output = "";
     
     var i = 0;
     
     while(i < chars1.count && i < chars2.count && chars1[i] == chars2[i]) {
     output = output + String(chars1[i]);
     i += 1;
     }
     
     return output;
     }
     */
    
    //20 Valid Parentheses
    func isValid(_ s: String) -> Bool {
        // 先確認是雙數
        // 再確認總數
        // 要馬就是第一組在隔壁
        // 要馬就是第一個對最後一個
        
        // 用stack的概念：先進後出
        var stack = [Character]()
        // --> 字串(String)是由一連串的字元(Characters)所組成，我們來看看字串、字元有哪些函式可以運用。
        
        for (_, char) in s.enumerated() {
            if let topChar = stack.last {
                print("char:\(char)")
                if  (topChar == ("(") as Character && char == (")") as Character) ||
                        (topChar == ("[") as Character && char == ("]") as Character) ||
                        (topChar == ("{") as Character && char == ("}") as Character){
                    stack.removeLast();
                    print("1:\(stack)")
                }
                else {
                    stack.append(char);
                    print("2:\(stack)")
                }
            }
            else {
                stack.append(char);
                print("3:\(stack)")
            }
        }
        return stack.isEmpty
        
        //        if sArray[0] != "{" && sArray[0] != "(" && sArray[0] != "[" {
        //            return false
        //        }
        //
        //        if sCount%2 == 0 {
        //            for i in 0...sCount-1{
        //                switch sArray[i] {
        //                case "{","}":
        //                    if sArray[i] == "{" && sArray[i+1] != "}" {
        //                        let totalTo2 = abs(sCount-1-i)
        //                        if sArray[totalTo2] != "}" {
        //                            return false
        //                        }
        //                    }else{
        //                        return false
        //                    }
        //                case "[","]":
        //                    if sArray[i] == "[" && sArray[i+1] != "]" {
        //                        let totalTo2 = abs(sCount-1-i)
        //                        if sArray[totalTo2] != "]" {
        //                            return false
        //                        }
        //                    }else{
        //                        return false
        //                    }
        //                case "(",")":
        //                    if sArray[i] == "(" && sArray[i+1] != ")" {
        //                        let totalTo2 = abs(sCount-1-i)
        //                        if sArray[totalTo2] != ")" {
        //                            return false
        //                        }
        //                    }else{
        //                        return false
        //                    }
        //                default : return false
        //                }
        //                if i == sCount-1 { return true }
        //            }
        //
        //            return true
        //        }else{
        //            return false
        //        }
    }
    
    //26 Remove Duplicates from Sorted Array
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
