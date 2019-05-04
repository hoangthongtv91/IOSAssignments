//
//  String+DPStringTool.swift
//  TipCalculator
//
//  Created by Thong Hoang Nguyen on 2019-04-30.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

extension String {
    subscript(index: Int) -> String {
        get {
            return String(self[self.index(startIndex, offsetBy: index)])
        }
        set {
            let startIndex = self.index(self.startIndex, offsetBy: index)
            self = self.replacingCharacters(in: startIndex..<self.index(after: startIndex), with: newValue)
        }
    }
    
    subscript(start: Int, end: Int) -> String {
        get {
            let startIndex = self.index(self.startIndex, offsetBy: start)
            let endIndex = self.index(self.startIndex, offsetBy: end)
            return String(self[startIndex..<endIndex])
        }
        set {
            let startIndex = self.index(self.startIndex, offsetBy: start)
            let endIndex = self.index(self.startIndex, offsetBy: end)
            self = self.replacingCharacters(in: startIndex..<endIndex, with: newValue)
        }
    }
    
    public var isDigits: Bool {
        return CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: self))
    }
    
    var fileURL: URL {
        return URL(fileURLWithPath: self)
    }
    var pathExtension: String {
        return fileURL.pathExtension
    }
    var lastPathComponent: String {
        return fileURL.lastPathComponent
    }
}
