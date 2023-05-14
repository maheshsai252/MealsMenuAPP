//
//  Extensions.swift
//  Meal
//
//  Created by Mahesh sai on 5/13/23.
//

import Foundation
import SwiftUI
extension String {
    
    /// Replaces Digits Followed By Parentheses
    /// - Returns: Digits Replaced string
    func replaceDigitsFollowedByParentheses() -> String {
        let regex = try! NSRegularExpression(pattern: "(\\d+)\\)")
        return regex.stringByReplacingMatches(in: self, options: [], range: NSRange(location: 0, length: self.count), withTemplate: "")
    }
    
    /// Removes Leading Spaces of String
    /// - Returns: Space Trimmed string
    func removeLeadingSpaces() -> String {
        return self.trimmingCharacters(in: .whitespaces)
    }
}

extension Color {
    // Fetches Complementary opposite color
    static var oppositePrimary: Color {
        #if !os(macOS)
        if UITraitCollection.current.userInterfaceStyle == .dark {
            return .black
        } else {
            return .white
        }
        #else
        if UserDefaults.standard.string(forKey: "AppleInterfaceStyle") == "Dark" {
            return .black
        } else {
            return .white
        }
        #endif
    }
}
