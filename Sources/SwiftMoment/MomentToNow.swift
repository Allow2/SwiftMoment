//
//  MomentToNow.swift
//  SwiftMoment
//
//  Created by Andrew Longhorn on 16/01/2021.
//  Copyright © 2021 Andrew Longhorn. All rights reserved.
//

import Foundation

extension Moment {

    /// Returns a localized string specifying the time duration between
    /// the present moment and the current instance.
    ///
    /// - returns: A localized string.
    public func toNow() -> String {
        let timeDiffDuration = self.intervalSince(moment())
        let deltaSeconds = Int(timeDiffDuration.seconds)
        
        var value: Int!
        
        if deltaSeconds < 5 {
            // Just Now
            return "a few seconds"
            
        }
        else if deltaSeconds < minuteInSeconds {
            // Seconds Ago
            return stringFromFormat("%%d %@seconds", withValue: deltaSeconds)
            
        }
        else if deltaSeconds < (minuteInSeconds * 2) {
            // A Minute Ago
            return NSDateTimeAheadLocalizedStrings("a minute")
            
        }
        else if deltaSeconds < hourInSeconds {
            // Minutes Ago
            return stringFromFormat("%%d %@minutes", withValue: deltaSeconds / minuteInSeconds)
            
        }
        else if deltaSeconds < (hourInSeconds * 2) {
            // An Hour Ago
            return NSDateTimeAheadLocalizedStrings("an hour")
            
        }
        else if deltaSeconds < dayInSeconds {
            // Hours Ago
            value = inbt(floor(deltaSeconds / hourInSeconds))
            return stringFromFormat("%%d %@hours", withValue: value)
            
        }
        else if deltaSeconds < (dayInSeconds * 2) {
            // Yesterday
            return NSDateTimeAheadLocalizedStrings("one day")
            
        }
        else if deltaSeconds < weekInSeconds {
            // Days Ago
            value = Int(floor(deltaSeconds / dayInSeconds))
            return stringFromFormat("%%d %@days", withValue: value)
            
        }
        else if deltaSeconds < (weekInSeconds * 2) {
            // Last Week
            return NSDateTimeAheadLocalizedStrings("one week")
            
        }
        else if deltaSeconds < monthInSeconds {
            // Weeks Ago
            value = Int(floor(deltaSeconds / weekInSeconds))
            return self.stringFromFormat("%%d %@weeks", withValue: value)
            
        }
        else if deltaSeconds < (dayInSeconds * 61) {
            // Last month
            return NSDateTimeAheadLocalizedStrings("one month")
            
        }
        else if deltaSeconds < yearInSeconds {
            // Month Ago
            value = Int(floor(deltaSeconds / monthInSeconds))
            return stringFromFormat("%%d %@months", withValue: value)
            
        }
        else if deltaSeconds < (yearInSeconds * 2) {
            // Last Year
            return NSDateTimeAheadLocalizedStrings("one year")
        }
        
        // Years Ago
        value = Int(floor(deltaSeconds / yearInSeconds))
        return stringFromFormat("%%d", withValue: value)
    }
    
    fileprivate func stringFromFormat(_ format: String, withValue value: Int) -> String {
        return String(value)
        // TODO: FIX
        //      let localeFormat = String(
//                                format: format,
//                                getLocaleFormatUnderscoresWithValue(Double(value))
//                                )
////        return value
//        return String(format: NSDateTimeAgoLocalizedStrings(localeFormat), value)
    }

    fileprivate func NSDateTimeAheadLocalizedStrings(_ key: String) -> String {
      // get framework bundle
      guard let bundleIdentifier = Bundle(for: MomentBundle.self).bundleIdentifier  else {
        return ""
      }
      
      guard let frameworkBundle = Bundle(identifier: bundleIdentifier) else {
        return ""
      }

      guard let resourcePath = frameworkBundle.resourcePath else {
        return ""
      }

      let bundleName = "MomentToNow.bundle"
      let path = URL(fileURLWithPath:resourcePath).appendingPathComponent(bundleName)
      guard let bundle = Bundle(url: path) else {
        return ""
      }

      let localeIdentifer = self.locale.identifier
      guard let languagePath = bundle.path(forResource: localeIdentifer, ofType: "lproj"),
        let languageBundle = Bundle(path: languagePath)
        else {
          return ""
      }

      return languageBundle.localizedString(forKey: key, value: "", table: "NSDateTimeAgo")
    }

    fileprivate func getLocaleFormatUnderscoresWithValue(_ value: Double) -> String {
      guard let localeCode = Locale.preferredLanguages.first else {
        return ""
      }

      if localeCode == "ru" {
        let XY = Int(floor(value)) % 100
        let Y = Int(floor(value)) % 10

        if Y == 0 || Y > 4 || (XY > 10 && XY < 15) {
          return ""
        }

        if Y > 1 && Y < 5 && (XY < 10 || XY > 20) {
          return "_"
        }

        if Y == 1 && XY != 11 {
          return "__"
        }
      }

      return ""
    }
}
