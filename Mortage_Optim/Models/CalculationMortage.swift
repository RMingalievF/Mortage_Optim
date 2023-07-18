//
//  CalculationMortage.swift
//  Mortage_Optim
//
//  Created by Руслан Мингалиев on 28.06.2023.

class Mortgage {
    
    let mortgageDebit: Float // Сумма ипотеки
    //var mortgageBalance: Float // Остаток по ипотеке
    
    let mortgageTermMonths: Int // Срок ипотеки в месяцах
    let interestRate: Float  // Процентная ставка
    
    var listMonthlyPayment: [Int: [Float]] {
        calculateListMonthlyPayment()
    }
    
    //ОБЩАЯ_СТАВКА = (1 + ЕЖЕМЕСЯЧНАЯ_СТАВКА) ^ СРОК_ИПОТЕКИ_МЕСЯЦЕВ
    var totalRate: Float {
        calculateTotalRate ()
    }
    //ЕЖЕМЕСЯЧНАЯ_СТАВКА
    var monthlyinterestRate: Float{
        interestRate/12/100
    }
    //ЕЖЕМЕСЯЧНЫЙ_ПЛАТЕЖ = СУММА_КРЕДИТА * ЕЖЕМЕСЯЧНАЯ_СТАВКА * ОБЩАЯ_СТАВКА / (ОБЩАЯ_СТАВКА - 1)
    var monthlyPayment: Float{
        mortgageDebit * monthlyinterestRate * totalRate / (totalRate - 1.0)
    }
    //ПРОЦЕНТНАЯ_ЧАСТЬ = ОСТАТОК_ДОЛГА * ЕЖЕМЕСЯЧНАЯ_СТАВКА
    var percentagePart: Float {
        mortgageDebit * monthlyinterestRate
    }
    //ОСНОВНАЯ_ЧАСТЬ = ЕЖЕМЕСЯЧНЫЙ_ПЛАТЕЖ - ПРОЦЕНТНАЯ_ЧАСТЬ
    var mainPart: Float {
        monthlyPayment - percentagePart
    }
    //ПЕРЕПЛАТА = ЕЖЕМЕСЯЧНЫЙ_ПЛАТЕЖ * СРОК_ИПОТЕКИ_МЕСЯЦЕВ - СУММА_КРЕДИТА
    var overpayment: Float{
        monthlyPayment * Float(mortgageTermMonths) - mortgageDebit
    }
    
    init(mortgageDebit: Float, mortgageTermMonths: Int, interestRate: Float) {
        self.mortgageDebit = mortgageDebit
        self.mortgageTermMonths = mortgageTermMonths
        self.interestRate = interestRate
        
    }
    //ОБЩАЯ_СТАВКА = (1 + ЕЖЕМЕСЯЧНАЯ_СТАВКА) ^ СРОК_ИПОТЕКИ_МЕСЯЦЕВ
    
     func calculateTotalRate () -> Float{
         var total: Float = 1
        for _ in 1...mortgageTermMonths {
            total *= (1.0 + monthlyinterestRate)
        }
         return total
    }
    
    //ПРОЦЕНТНАЯ_ЧАСТЬ = 1 500 000 руб * 0.008 = 12 000 руб
   // ОСНОВНАЯ_ЧАСТЬ = 14 080 руб - 12 000 руб = 2 080 руб
    
   private func calculateListMonthlyPayment() -> [Int: [Float]]{
        var listPayment = [Int: [Float]]()
       // let listPaymentSorted =  [Int: [Float]]()
       
        var mortgageBalance = mortgageDebit
        for numberPayment in 1...mortgageTermMonths {
            var percentPart = (mortgageBalance * monthlyinterestRate)
            percentPart.round(.toNearestOrAwayFromZero)
            var mainPart = monthlyPayment - percentPart
            mainPart.round(.toNearestOrAwayFromZero)
            let recult = percentPart + mainPart
            
            listPayment[numberPayment] = [mortgageBalance, percentPart, mainPart, recult]
            
            print(listPayment)
            mortgageBalance = mortgageBalance - mainPart
            
            
        }
return listPayment
    }
}
