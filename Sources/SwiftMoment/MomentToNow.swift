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
        let deltaSeconds = timeDiffDuration.seconds
        
        var value: Double!
        
        if deltaSeconds < 5 {
            // Just Now
            return "a few seconds"
            
        }
        else if deltaSeconds < minuteInSeconds {
            // Seconds Ago
            return stringFromFormat("%%1.0f %@seconds", withValue: deltaSeconds)
            
        }
        else if deltaSeconds < (minuteInSeconds * 2) {
            // A Minute Ago
            return NSDateTimeAgoLocalizedStrings("a minute")
            
        }
        else if deltaSeconds < hourInSeconds {
            // Minutes Ago
            return stringFromFormat("%%1.0f %@minutes", withValue: deltaSeconds / minuteInSeconds)
            
        }
        else if deltaSeconds < (hourInSeconds * 2) {
            // An Hour Ago
            return NSDateTimeAgoLocalizedStrings("an hour")
            
        }
        else if deltaSeconds < dayInSeconds {
            // Hours Ago
            value = floor(deltaSeconds / hourInSeconds)
            return stringFromFormat("%%1.0f %@hours", withValue: value)
            
        }
        else if deltaSeconds < (dayInSeconds * 2) {
            // Yesterday
            return NSDateTimeAgoLocalizedStrings("one day")
            
        }
        else if deltaSeconds < weekInSeconds {
            // Days Ago
            value = floor(deltaSeconds / dayInSeconds)
            return stringFromFormat("%%1.0f %@days", withValue: value)
            
        }
        else if deltaSeconds < (weekInSeconds * 2) {
            // Last Week
            return NSDateTimeAgoLocalizedStrings("one week")
            
        }
        else if deltaSeconds < monthInSeconds {
            // Weeks Ago
            value = floor(deltaSeconds / weekInSeconds)
            return self.stringFromFormat("%%1.0f %@weeks", withValue: value)
            
        }
        else if deltaSeconds < (dayInSeconds * 61) {
            // Last month
            return NSDateTimeAgoLocalizedStrings("one month")
            
        }
        else if deltaSeconds < yearInSeconds {
            // Month Ago
            value = floor(deltaSeconds / monthInSeconds)
            return stringFromFormat("%%1.0f %@months", withValue: value)
            
        }
        else if deltaSeconds < (yearInSeconds * 2) {
            // Last Year
            return NSDateTimeAgoLocalizedStrings("one year")
        }
        
        // Years Ago
        value = floor(deltaSeconds / yearInSeconds)
        return stringFromFormat("%%1.0f %@years", withValue: value)
    }
}
