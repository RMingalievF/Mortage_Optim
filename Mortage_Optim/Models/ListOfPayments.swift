//
//  ListOfPayments.swift
//  Mortage_Optim
//
//  Created by Руслан Мингалиев on 14.08.2023.
//

struct ListOfPaymentsDebit {
    let datePayments: String
    let detailsPayment: [Float]
}

//struct details {
//    let deposit: Float
//    let rateDeposit: Float
//
//}


extension ListOfPaymentsDebit {
    
   static var deposit = Deposit(startDeposit: 1000.0, duratuion: 12, capitalizationPeriod: 12, interestRateDeposit: 10, overCach: 0)
    
    
}
