//
//  CalculationDebit.swift
//  Mortage_Optim
//
//  Created by Руслан Мингалиев on 10.07.2023.
//

import Foundation

class Deposit {
    
    let startDeposit: Float
    let duratuion: Int
    let capitalizationPeriod: Float
    let interestRateDeposit: Float  // Процентная ставка
    let overCach: Float
    
    //ЕЖЕМЕСЯЧНАЯ_СТАВКА
   private var monthlyinterestRateDeposit: Float{
        interestRateDeposit/12/100
    }
    
    var test: [Int: [Float]]{
        calculateDeposit(capitalizationPeriod: capitalizationPeriod)
    }
    
    
        init(startDeposit: Float, duratuion: Int, capitalizationPeriod: Float, interestRateDeposit: Float, overCach: Float) {
            self.startDeposit = startDeposit
            self.duratuion = duratuion
            self.capitalizationPeriod = capitalizationPeriod
            self.interestRateDeposit = interestRateDeposit
            self.overCach = overCach
        }
        
        
    private func calculateDeposit(capitalizationPeriod: Float) -> [Int: [Float]] {
            var listDeposit = [Int: [Float]]()
        var newDebitBalance = startDeposit
        switch capitalizationPeriod {
        case 12:
            for numberCapital in 1...duratuion {
               let newDeposit = newDebitBalance * monthlyinterestRateDeposit
                newDebitBalance = newDebitBalance + newDeposit
                listDeposit[numberCapital] = [newDebitBalance, newDeposit]
            }
        default:
            break
        }
            
            
            
            
            
            return listDeposit
        }
}

