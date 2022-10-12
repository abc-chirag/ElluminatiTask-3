//
//  Date+Extension.swift
//  Trichordal
//
//  Created by Kartum Infotech on 15/02/19.
//  Copyright © 2019 Kartum Infotech. All rights reserved.
//

import Foundation

extension Date {
    public func getDateStringWithFormate(_ formate: String, timezone: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = formate
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(abbreviation: timezone)
        return formatter.string(from: self)
    }
    func addMinutes(minutes: Int) -> Date {
          return Calendar(identifier: .gregorian).date(byAdding: .minute, value: minutes, to: self)!
      }
}
