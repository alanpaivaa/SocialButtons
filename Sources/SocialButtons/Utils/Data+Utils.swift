//
//  File.swift
//  
//
//  Created by Alan Paiva on 7/17/23.
//

import Foundation

extension Date {
    func iso8601Formatted() -> String {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withFullDate]
        return formatter.string(from: self)
    }
}
