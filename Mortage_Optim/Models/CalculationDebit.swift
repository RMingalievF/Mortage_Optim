//
//  CalculationDebit.swift
//  Mortage_Optim
//
//  Created by Руслан Мингалиев on 10.07.2023.
//

//import Foundation

struct Deposit {
    
    var startDeposit: Float = 0
    var duratuion: Int = 0//на какой срок вклад в месяцах
    //var capitalizationPeriod = CapitalizationPeriod.self //Когда происходит капитализация, ежемесячно, квартально, в год
    var interestRateDeposit: Float = 0// Процентная ставка
    var overCach: Float = 0//Пополнение вклада
    
    //ЕЖЕМЕСЯЧНАЯ_СТАВКА
   private var monthlyinterestRateDeposit: Float{
        interestRateDeposit/12/100
    }
    
//    var test: [[Float]]{
//        calculateDeposit(capitalizationPeriod: CapitalizationPeriod.year)
//    }
    enum CapitalizationPeriod {
    case month
    case quartely
    case year
    case toEndDeposit
    }
    
//        init(startDeposit: Float, duratuion: Int, interestRateDeposit: Float, overCach: Float) {
//            self.startDeposit = startDeposit
//            self.duratuion = duratuion
//            //self.capitalizationPeriod = capitalizationPeriod.self
//            self.interestRateDeposit = interestRateDeposit
//            self.overCach = overCach
//        }
        
        
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

