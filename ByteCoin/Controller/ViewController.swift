//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    var coinManager = CoinManager()
    var selectedCurrency: String = "USD"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        coinManager.delegate = self
        currencyLabel.text = selectedCurrency // Set initial currency label
    }
}

// MARK: - CoinManagerDelegate
extension ViewController: CoinManagerDelegate {
    func didUpdatePrice(price: Double) {
        // Format the price to 2 decimal places
        let formattedPrice = String(format: "%.2f", price)
        bitcoinLabel.text = "\(formattedPrice)"
    }
    
    func didFailWithError(_ error: Error) {
        print("Error: \(error.localizedDescription)")
    }
}

// MARK: - UIPickerViewDataSource
extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
}

// MARK: - UIPickerViewDelegate
extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCurrency = coinManager.currencyArray[row]
        currencyLabel.text = selectedCurrency // Update currency label
        coinManager.getCoinPrice(for: selectedCurrency)
    }
}
