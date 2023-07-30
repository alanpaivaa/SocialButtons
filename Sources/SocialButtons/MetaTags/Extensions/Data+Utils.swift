//
//  File.swift
//  
//
//  Created by Alan Paiva on 7/17/23.
//

import Foundation

extension Date {
    func iso8601DateFormatted() -> String {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withFullDate]
        return formatter.string(from: self)
    }

    func iso8601DateTimeFormatted() -> String {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withFullDate, .withFullTime]
        return formatter.string(from: self)
    }
}
