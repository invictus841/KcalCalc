//
//  TimeFormatting.swift
//  KcalCalc
//
//  Created by Alexandre Talatinian on 15/08/2022.
//

import Foundation

func calcTimeSince(date: Date) -> String {
    let minutes = Int(-date.timeIntervalSinceNow)/60
    let hours = minutes/60
    let days = hours/24
    
    if minutes < 120 {
        return minutes > 1 ? "\(minutes) minutes ago" : "\(minutes) minute ago"
    } else if minutes >= 120 && hours < 24 {
        return "\(hours) hours ago"
    } else if hours > 24 && hours < 48 {
        return "\(days) day ago"
    } else {
        return "\(days) days ago"
    }
}
