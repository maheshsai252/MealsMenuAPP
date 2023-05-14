//
//  MealError.swift
//  Meal
//
//  Created by Mahesh sai on 5/13/23.
//

import Foundation
enum MealError: Error {
    // Throw when an invalid password is entered
    case invalidUrl
    
    // Throw when an expected resource is not found
    case notFound
    
    // Throw in all other cases
    case unexpected(message: String)
}

extension MealError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .invalidUrl:
            return "The URL is not valid."
        case .notFound:
            return "The requested item could not be found."
        case .unexpected(_):
            return "An unexpected error occurred."
        }
    }
}
