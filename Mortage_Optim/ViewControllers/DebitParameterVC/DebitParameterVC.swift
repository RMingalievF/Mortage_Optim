//
//  DebitParameterVC.swift
//  Mortage_Optim
//
//  Created by Руслан Мингалиев on 08.08.2023.
//

import UIKit

class DebitParameterVC: UIViewController {

   
    @IBOutlet weak var TableViewListPayment: UITableView!
   
    
    private var deposit = Deposit(startDeposit: 1000.0, duratuion: 12, capitalizationPeriod: 12, interestRateDeposit: 10, overCach: 0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func calcculationDebitButton(_ sender: UIButton) {
         
        
        
    }
    
    
    
    
    
    
    
    
    
}
extension DebitParameterVC: UITableViewDelegate, UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deposit.test.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)
        let listPayment = deposit.test[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = String(listPayment.first!)
        content.secondaryText = String(listPayment.last!)
        cell.contentConfiguration = content
    
    return cell
    }
}
