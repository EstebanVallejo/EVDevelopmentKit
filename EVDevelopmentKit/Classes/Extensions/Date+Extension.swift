//
//  Date+Extension.swift
//  Wuzhear
//
//  Created by Steve on 3/31/17.
//  Copyright © 2017 Infinixsoft. All rights reserved.
//

import Foundation

public extension Date {
  
  public static func timeAgoSince(date: Date, numericDates: Bool = false) -> String {
    return date.timeAgo(numericDates: numericDates)
  }
  
  public func timeAgo(numericDates: Bool = false) -> String {
    let calendar = NSCalendar.current
    let unitFlags: Set<Calendar.Component> = [.minute, .hour, .day, .weekOfYear, .month, .year, .second]
    let now = Date()
    let earliest = now < self ? now : self
    let latest = (earliest == now) ? self : now
    let components = calendar.dateComponents(unitFlags, from: earliest,  to: latest)
    
    if (components.year! >= 2) {
      return "\(components.year!) years ago"
      
    } else if (components.year! >= 1){
      return numericDates ? "1 year ago" : "Last year"
      
    } else if (components.month! >= 2) {
      return "\(components.month!) months ago"
      
    } else if (components.month! >= 1) {
      return numericDates ? "1 month ago" : "Last month"
      
    } else if (components.weekOfYear! >= 2) {
      return "\(components.weekOfYear!) weeks ago"
      
    } else if (components.weekOfYear! >= 1) {
      return numericDates ? "1 week ago" : "Last week"
      
    } else if (components.day! >= 2) {
      return "\(components.day!) days ago"
      
    } else if (components.day! >= 1){
      return numericDates ? "1 day ago" : "Yesterday"
      
    } else if (components.hour! >= 2) {
      return "\(components.hour!) hours ago"
      
    } else if (components.hour! >= 1) {
      return numericDates ? "1 hour ago" : "An hour ago"
      
    } else if (components.minute! >= 2) {
      return "\(components.minute!) minutes ago"
      
    } else if (components.minute! >= 1) {
      return numericDates ? "1 minute ago" : "A minute ago"
      
    } else if (components.second! >= 3) {
      return "\(components.second!) seconds ago"
      
    } else {
      return "Just now"
    }
    
  }
  
}
