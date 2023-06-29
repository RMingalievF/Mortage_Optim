//
//  CalculationMortage.swift
//  Mortage_Optim
//
//  Created by Руслан Мингалиев on 28.06.2023.
//ОБЩАЯ_СТАВКА = (1 + ЕЖЕМЕСЯЧНАЯ_СТАВКА) ^ СРОК_ИПОТЕКИ_МЕСЯЦЕВ
// ЕЖЕМЕСЯЧНЫЙ_ПЛАТЕЖ = СУММА_КРЕДИТА * ЕЖЕМЕСЯЧНАЯ_СТАВКА * ОБЩАЯ_СТАВКА / (ОБЩАЯ_СТАВКА - 1)
//

class Mortgage {
    
    let mortgageDebit: Float // Сумма ипотеки
    let mortgageTermMonths: Int // Срок ипотеки в днях
    let interestRate: Float  // Процентная ставка
    
    //Общая ставка
    var totalRate: Float {
        calculateTotalRate ()
        }
    private var monthlyinterestRate: Float{
        interestRate/12/100
    }
    // Ежемесячный платеж
    var monthlyPayment: Float{
        mortgageDebit * monthlyinterestRate * totalRate / (totalRate - 1.0)
    }
    
    init(mortgageDebit: Float, mortgageTermMonths: Int, interestRate: Float) {
        self.mortgageDebit = mortgageDebit
        self.mortgageTermMonths = mortgageTermMonths
        self.interestRate = interestRate
            //self.monthlyPayment = monthlyPayment
    }
    
   private func calculateTotalRate () -> Float{
        var total: Float = 0.0
            for _ in 1...mortgageTermMonths {
                total *= (1.0 + monthlyinterestRate)
            }
    return total
    }
    
}
