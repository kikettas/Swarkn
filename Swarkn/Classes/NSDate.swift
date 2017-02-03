//
//  NSDate.swift
//  Worktoday
//
//  Created by kikettas on 12/2/16.
//  Copyright © 2016. All rights reserved.
//

import Foundation

extension Date{
    
    public static let dayInMinutes:Double = 1440
    public static let dayInSeconds:Double = 86400
    public static let dayInMiliSeconds:Double = 86400000
    
    public enum TimeUnit{
        case milisecond,second,minute,hour,day,week,month,year
    }
    
    public var timeIntervalSince1970InMs : Double{
        get{
            return self.timeIntervalSince1970 * 1000
        }
    }
    
    public enum DateSymbolsLongitude{
        case short, veryShort, standalone, normal
    }
    
    public func monthName(_ dateSymbolsLongityde:DateSymbolsLongitude, monthNumber:Int)-> String{
        let dateFormatter: DateFormatter = DateFormatter()
        let months:[String]?
        switch dateSymbolsLongityde{
        case .short:
            months = dateFormatter.shortMonthSymbols
            break
        case .veryShort:
            months = dateFormatter.veryShortMonthSymbols
            break
        case .standalone:
            months = dateFormatter.standaloneMonthSymbols
            break
        case .normal:
            months = dateFormatter.monthSymbols
            break
        }
        return months![monthNumber]
    }
    
    public func weekDayName(_ dateSymbolsLongityde:DateSymbolsLongitude, dayNumber:Int)-> String{
        let dateFormatter: DateFormatter = DateFormatter()
        let days:[String]?
        switch dateSymbolsLongityde{
        case .short:
            days = dateFormatter.shortWeekdaySymbols
            break
        case .veryShort:
            days = dateFormatter.veryShortWeekdaySymbols
            break
        case .standalone:
            days = dateFormatter.standaloneWeekdaySymbols
            break
        case .normal:
            days = dateFormatter.weekdaySymbols
            break
        }
        return days![dayNumber]
    }
    
    public func getYearMonthDay() -> (Int, Int, Int){
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components([NSCalendar.Unit.year,NSCalendar.Unit.month,NSCalendar.Unit.day], from: self)
        return (components.year!,components.month!,components.day!)
    }
    
    public static func from(unit:TimeUnit, value:Int, toUnit:TimeUnit) -> Double{
        let toMsScale = [1,1000,60000,3600000,86400000]
        var fromIndexOnArray:Int = 0
        var toIndexOnArray:Int = 0
        
        switch unit{
        case .milisecond:
            fromIndexOnArray = 0
            break
        case .second:
            fromIndexOnArray = 1
            break
        case .minute:
            fromIndexOnArray = 2
        case .hour:
            fromIndexOnArray = 3
        case .day:
            fromIndexOnArray = 4
        default:
            break
        }
        
        switch toUnit{
        case .milisecond:
            toIndexOnArray = 0
            break
        case .second:
            toIndexOnArray = 1
            break
        case .minute:
            toIndexOnArray = 2
        case .hour:
            toIndexOnArray = 3
        case .day:
            toIndexOnArray = 4
        default:
            break
        }
        
        return Double(value * toMsScale[fromIndexOnArray] / toMsScale[toIndexOnArray])
    }
}

