//
//  ExtensionDouble.swift
//  Trackincrease
//
//  Created by Ilya Kokorin on 12.08.2024.
//

import Foundation

extension Double{
    func cutOff() -> Double{
        let strValue = String(format: "%.1f", self)
        if let resultValue : Double = Double(strValue){
            return resultValue
        } else {
            return 404.0
            }
    }
}


public extension String {
  func indexInt(of char: Character) -> Int? {
    return firstIndex(of: char)?.utf16Offset(in: self)
  }
}
