//
//  File.swift
//  Utils
//
//  Created by Jan Timar on 29.12.2024.
//

import Foundation

public extension Date {
    /// Return string in specific date format and c
    /// - Parameters:
    ///   - dateFormatt:Requested date format from predefined option in`DateFormat` enum
    ///   - locale:Localization for formatting result, when is not defined will be used `.current`
    ///   device Locale ( not app Locale!)
    /// - Returns: Date formated by selected format and locale
    func string(
        _ dateFormatt: DateFormat,
        locale: Locale = .current
    ) -> String {
        dateFormatt.dateFormatter(locale: locale).string(from: self)
    }
}

protocol StringDateFormatter {
    func string(from: Date) -> String
}

public extension String {
    func date(
        _ dateFormatter: DateFormat,
        locale: Locale = .current
    ) -> Date? {
        dateFormatter.dateFormatter(locale: locale)
            .date(from: self)
    }
}

public enum DateFormat {
    /// For example: 2006-03-24
    case apiDay
    /// For example: 12.3.2006
    case appDay

    func dateFormatter(locale: Locale = .current) -> DateFormatter {
        switch self {
        case .apiDay:
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            formatter.locale = locale
            return formatter
        case .appDay:
            let formatter = DateFormatter()
            formatter.dateFormat = "d.M.yyyy"
            formatter.locale = locale
            return formatter
        }
    }
}
