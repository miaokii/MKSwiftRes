//
//  StringEx.swift
//  MKSwiftRes
//
//  Created by miaokii on 2021/1/28.
//
import Foundation

// 格式化金额
public extension String {
    
    /// 格式化金额
    /// - Parameters:
    ///   - value: 金额值
    ///   - numberStyle: NumberFormatter.Style类型，表示格式化格式
    /// - Returns: 格式化后的值
    static func priceBy(value: Double, numberStyle: NumberFormatter.Style = .currency) -> String {
        let amountFormatter = NumberFormatter.init()
        amountFormatter.numberStyle = numberStyle
        return amountFormatter.string(from: NSNumber.init(value: value)) ?? ""
    }
        
    /// 格式化人名币金额，不显示羊角符
    /// - Parameter value: 金额值
    /// - Returns: 格式化后的值
    static func price_without_claw(value: Double) -> String {
        let price = priceBy(value: value)
        if price.hasPrefix("¥") || price.hasPrefix("￥") {
            return price[1..<price.count]
        }
        return price
    }
    
    /// 转换double为string
    /// - Parameters:
    ///   - value: double值
    ///   - numberStyle: 转换格式，默认decimal
    /// - Returns: 转换后值
    static func decimal(value: Double, style: NumberFormatter.Style = .decimal) -> String {
        let amountFormatter = NumberFormatter.init()
        amountFormatter.numberStyle = style
        return amountFormatter.string(from: NSNumber.init(value: value)) ?? ""
    }
    
    static func decimal(value: Float, style: NumberFormatter.Style = .decimal) -> String {
        let amountFormatter = NumberFormatter.init()
        amountFormatter.numberStyle = style
        return amountFormatter.string(from: NSNumber.init(value: value)) ?? ""
    }
    
    subscript(offset: Int) -> Character {
        get {
            return self[index(startIndex, offsetBy: offset)]
        }
        set {
            replaceSubrange(index(startIndex, offsetBy: offset)..<index(startIndex, offsetBy: offset + 1), with: [newValue])
        }
    }
    
    subscript(range: CountableRange<Int>) -> String {
        get {
            return String(self[index(startIndex, offsetBy: range.lowerBound)..<index(startIndex, offsetBy: range.upperBound)])
        }
        set {
            replaceSubrange(index(startIndex, offsetBy: range.lowerBound)..<index(startIndex, offsetBy: range.upperBound), with: newValue)
        }
    }
    
    subscript(location: Int, length: Int) -> String {
        get {
            return String(self[index(startIndex, offsetBy: location)..<index(startIndex, offsetBy: location + length)])
        }
        set {
            replaceSubrange(index(startIndex, offsetBy: location)..<index(startIndex, offsetBy: location + length), with: newValue)
        }
    }
}
