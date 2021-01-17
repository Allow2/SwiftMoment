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
            return NSDateTimeAgoLocalizedStrings("a minute")
            
        }
        else if deltaSeconds < hourInSeconds {
            // Minutes Ago
            return stringFromFormat("%%d %@minutes", withValue: deltaSeconds / minuteInSeconds)
            
        }
        else if deltaSeconds < (hourInSeconds * 2) {
            // An Hour Ago
            return NSDateTimeAgoLocalizedStrings("an hour")
            
        }
        else if deltaSeconds < dayInSeconds {
            // Hours Ago
            value = inbt(floor(deltaSeconds / hourInSeconds))
            return stringFromFormat("%%d %@hours", withValue: value)
            
        }
        else if deltaSeconds < (dayInSeconds * 2) {
            // Yesterday
            return NSDateTimeAgoLocalizedStrings("one day")
            
        }
        else if deltaSeconds < weekInSeconds {
            // Days Ago
            value = Int(floor(deltaSeconds / dayInSeconds))
            return stringFromFormat("%%d %@days", withValue: value)
            
        }
        else if deltaSeconds < (weekInSeconds * 2) {
            // Last Week
            return NSDateTimeAgoLocalizedStrings("one week")
            
        }
        else if deltaSeconds < monthInSeconds {
            // Weeks Ago
            value = Int(floor(deltaSeconds / weekInSeconds)0
            return self.stringFromFormat("%%d %@weeks", withValue: value)
            
        }
        else if deltaSeconds < (dayInSeconds * 61) {
            // Last month
            return NSDateTimeAgoLocalizedStrings("one month")
            
        }
        else if deltaSeconds < yearInSeconds {
            // Month Ago
            value = Int(floor(deltaSeconds / monthInSeconds))
            return stringFromFormat("%%d %@months", withValue: value)
            
        }
        else if deltaSeconds < (yearInSeconds * 2) {
            // Last Year
            return NSDateTimeAgoLocalizedStrings("one year")
        }
        
        // Years Ago
        value = Int(floor(deltaSeconds / yearInSeconds))
        return stringFromFormat("%%d", withValue: value)
    }
}
