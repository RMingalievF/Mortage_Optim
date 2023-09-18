//
//  CalculationDebit.swift
//  Mortage_Optim
//
//  Created by Руслан Мингалиев on 10.07.2023.
//

import Foundation

struct Deposit {
    
    var startDeposit: Float = 0
    var duratuion: Int = 0//на какой срок вклад в месяцах
    var interestRateDeposit: Float = 0// Процентная ставка
    var overCach: Float = 0//Пополнение вклада
    let startDayDeposit = Date()
    //ЕЖЕМЕСЯЧНАЯ_СТАВКА
   private var monthlyinterestRateDeposit: Float{
        interestRateDeposit/12/100
    }

    enum CapitalizationPeriod {
    case month
    case quartely
    case year
    case toEndDeposit
    }

    func calculateDeposit(capitalizationPeriod: CapitalizationPeriod) -> [[Float]] {
        var listDeposit = [[Float]]()
        var newDebitBalance = startDeposit
        listDeposit.append([newDebitBalance, 0])
            
        switch capitalizationPeriod {
            case .month:
                for _ in 1...duratuion {
                    
                    
                    
                    let newDeposit = newDebitBalance * monthlyinterestRateDeposit + overCach
                    newDebitBalance = newDebitBalance + newDeposit
                    listDeposit.append([newDebitBalance, newDeposit])
            }
            case .quartely:
                for _ in 1...duratuion {
                   let newDeposit = newDebitBalance * monthlyinterestRateDeposit + overCach
                    newDebitBalance = newDebitBalance + newDeposit
                    listDeposit.append([newDebitBalance, newDeposit])
                }
            case .year:
                for _ in 1...duratuion {
                   let newDeposit = newDebitBalance * monthlyinterestRateDeposit + overCach
                    newDebitBalance = newDebitBalance + newDeposit
                    listDeposit.append([newDebitBalance, newDeposit])
                }
            case .toEndDeposit:
                for _ in 1...duratuion {
                   let newDeposit = newDebitBalance * monthlyinterestRateDeposit + overCach
                    newDebitBalance = newDebitBalance + newDeposit
                    listDeposit.append([newDebitBalance, newDeposit])
                }
            }
            return listDeposit
            }
}
extension Deposit {
    
    func calculateQtyMonthsBetween(from: Date, to: Int) -> [String]{
        //let date = from
        let lastDayDebit = Calendar.current.date(byAdding: .month, value: to, to: from)!
        
        let monthBetween = Calendar.current.dateComponents([.month], from: from, to: lastDayDebit).month!
        var dates = [String]()
        for i in 0...monthBetween {
            let dateToPayment = Calendar.current.date(byAdding: .month, value: i, to: from)
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy"
            
            let daysBetween = Calendar.current.dateComponents([.day], from: from, to: dateToPayment!).day
            
            
            let dayToPayment = formatter.string(from: dateToPayment!)
            dates.append(dayToPayment)
        }
        
        //return dates
        return  dates//.map { $0.formatted(date: .numeric, time: .omitted) }
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
    
}
