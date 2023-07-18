//
//  CreateDateList.swift
//  Mortage_Optim
//
//  Created by Руслан Мингалиев on 10.07.2023.
//

import Foundation

let calendar = Calendar.current
let date = Date()
let dayOfWeek = calendar.component(.weekday, from: date)


let dateFormater = DateFormatter()
    //dateFormater.dateFormat = "dd.MM.yyyy"

let firstDayDebit = dateFormater.date(from: "31.01.2024")
let lastDayDebit = dateFormater.date(from: "31.03.2024")


func calculateQtyMonthsBetween(from: Date, to: Date) -> [Date]{
let monthBetween = Calendar.current.dateComponents([.month], from: from, to: to).month!
var dates = [Date]()
for i in 0...monthBetween {
    let dateToPayment = Calendar.current.date(byAdding: .month, value: i, to: from)
    dates.append(dateToPayment!)
    }

return dates
}

func calculateDaysBetweenMonth(listDays: [Date]) -> [Int] {
var daysBetweenMonthPayment = [Int]()
var indexDates: Int = 1

    for dateFrom in listDays{
        if indexDates < listDays.count{
            let daysBetween = Calendar.current.dateComponents([.day], from: dateFrom, to: listDays[indexDates] ).day
                daysBetweenMonthPayment.append(daysBetween!)
                indexDates = indexDates + 1
        }
    }
    return daysBetweenMonthPayment
    
}

