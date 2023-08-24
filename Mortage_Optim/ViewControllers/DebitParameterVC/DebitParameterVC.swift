//
//  DebitParameterVC.swift
//  Mortage_Optim
//
//  Created by Руслан Мингалиев on 08.08.2023.
//

import UIKit

class DebitParameterVC: UIViewController {

   
    @IBOutlet weak var tableViewListPayment: UITableView!
   
    @IBOutlet weak var depositTextField: UITextField!
    @IBOutlet weak var dateToOpenedTextField: UITextField!
    @IBOutlet weak var rateTextField: UITextField!
    @IBOutlet weak var capitalizationTextField: UITextField!
    @IBOutlet weak var durationTextField: UITextField!
    @IBOutlet weak var overCashTextField: UITextField!
    
    

    
    
    private var deposit = Deposit()
    private let calculateDate = CalculateDate()
    var depositTest = [[Float]]()
    var dates = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(dateChange(datePicker:)), for: UIControl.Event.valueChanged)
        datePicker.frame.size = CGSize(width: 0, height: 300)
        datePicker.preferredDatePickerStyle = .wheels
       
        dateToOpenedTextField.inputView = datePicker
        dateToOpenedTextField.text = dateFormat(date: Date())

        
        // Do any additional setup after loading the view.
    }
    
    @objc func dateChange(datePicker: UIDatePicker){
        dateToOpenedTextField.text = dateFormat(date: datePicker.date)
        
    }
    
    private func dateFormat(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        
        return formatter.string(from: date)
    }
    
    private func startDateString(dateString: String) -> Date {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd.MM.yyyy"
        let firstDayDebit = dateFormater.date(from: dateString)
        
        return firstDayDebit!
    }
    
    private func finishDateString(dateString: Date) -> Date {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd.MM.yyyy"
        let firstDayDebit = dateFormater.date(from: dateString)
        
        return firstDayDebit!
    }
    
    @IBAction func calcculationDebitButton(_ sender: UIButton) {
        deposit.startDeposit = Float(depositTextField.text!) ?? 0
        deposit.duratuion = Int(durationTextField.text!) ?? 1
        deposit.interestRateDeposit = Float(rateTextField.text!) ?? 0
        deposit.overCach = Float(overCashTextField.text!) ?? 0
        depositTest = deposit.calculateDeposit(capitalizationPeriod: .month)
        
        dates = calculateDate.calculateQtyMonthsBetween(from: startDateString(dateString: dateToOpenedTextField.text!),
                                                        to: finishDateString(dateString: <#T##Date#>))
        
        tableViewListPayment.reloadData()
        print(dates)
    }
    

    
    
}
extension DebitParameterVC: UITableViewDelegate, UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        depositTest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! UITableViewDebitParameterCell
        let listPayment = depositTest[indexPath.row]
        let listDate = dates[indexPath.row]

        cell.dateToPayment.text = String(listDate)
        cell.deposit.text = String(listPayment.first!)
        cell.rateToPayment.text = String(listPayment.last!)
    print(cell)
    return cell
    }
}


