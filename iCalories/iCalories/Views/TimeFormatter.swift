//
//  TimeFormatter.swift
//  iCalories
//
//  Created by Uday Kumar Kotla on 16/07/23.
//

import Foundation

func calcTimeSince(date:Date)->String{
    
    let minutes = Int(-date.timeIntervalSinceNow)/60
    print(-date.timeIntervalSinceNow)
    let hrs = minutes/60
    let days = hrs/24
    if(minutes<120){
        return "\(minutes) minutes ago"
    }
    else if(hrs<48){
        return "\(hrs) hours ago"
    }
    return "\(days) days ago"
}
