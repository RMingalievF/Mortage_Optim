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
    
    

    
    private let capitalization = PickerViewCapitalization()
    private var deposit = Deposit()
    private let calculateDate = CalculateDate()
    var depositTest = [[Float]]()
    var dates = [String]()
    var startDate: (String, Date) = ("", Date())
    var selectedElement: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        choiceUiElement()
        createToolBar()
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(dateChange(datePicker:)), for: UIControl.Event.valueChanged)
        datePicker.frame.size = CGSize(width: 0, height: 300)
        datePicker.preferredDatePickerStyle = .wheels
       
        dateToOpenedTextField.inputView = datePicker
        startDate = dateFormat(date: Date())
        dateToOpenedTextField.text = startDate.0
        
        // Do any additional setup after loading the view.
    }
    
    private func choiceUiElement() {
        let elementPicker = UIPickerView()
        elementPicker.delegate = self
        
        capitalizationTextField.inputView = elementPicker
        
    }
    
    private func createToolBar() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done",
                                         style: .plain,
                                         target: self,
                                         action: #selector(dismissKeyboard))
        toolBar.setItems([doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        
        capitalizationTextField.inputAccessoryView = toolBar
        
        toolBar.tintColor = .black
        toolBar.barTintColor = .blue
        
    }
    
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func dateChange(datePicker: UIDatePicker){
        let dateFormat = dateFormat(date: datePicker.date)
        
        dateToOpenedTextField.text = dateFormat.dateString
    }
    
    private func dateFormat(date: Date) -> (dateString: String, dateDate: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        
        let dateString = formatter.string(from: date)
        let dateDate = formatter.date(from: dateString)
        
        return (dateString, dateDate!)
    }
    
    
    @IBAction func calcculationDebitButton(_ sender: UIButton) {
        deposit.startDeposit = Float(depositTextField.text!) ?? 0
        deposit.duratuion = Int(durationTextField.text!) ?? 1
        deposit.interestRateDeposit = Float(rateTextField.text!) ?? 0
        deposit.overCach = Float(overCashTextField.text!) ?? 0
        depositTest = deposit.calculateDeposit(capitalizationPeriod: .month)
        
        dates = calculateDate.calculateQtyMonthsBetween(from: startDate.1, to: deposit.duratuion)

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
        cell.deposit.text = String(format:"%.02f", listPayment.first!)
        cell.rateToPayment.text = String(format:"%.02f", listPayment.last!)
    print(cell)
    return cell
    }
}

extension DebitParameterVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        capitalization.capitalization.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        capitalization.capitalization[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedElement = capitalization.capitalization[row]
        capitalizationTextField.text = selectedElement
        
        
        
        
    }
}
