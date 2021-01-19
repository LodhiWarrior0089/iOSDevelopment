//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

protocol CoinManagerDelegate{
    
    func didUpdatePrice(price :Double)
    
}


class ViewController: UIViewController {
    
    
   
    

    @IBOutlet weak var bitcoinLabel: UILabel!
    
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currencyPicker.dataSource = self
        coinManager.delegate = self
        currencyPicker.delegate=self
    }

    
    var coinManager = CoinManager()
    
   
    
    
}



//Mark: - UIPickerViewDelegate


extension ViewController:UIPickerViewDelegate,UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return coinManager.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        _ = coinManager.getCoinPrice(for: coinManager.currencyArray[row])
        currencyLabel.text = coinManager.currencyArray[row]
        
    }
    
}

//Mark: - CoinManagerDelegate


extension ViewController:CoinManagerDelegate{
    func didUpdatePrice(price: Double) {
        
        print(price
        )
        DispatchQueue.main.async {
            
            self.bitcoinLabel.text = String(price)
        }
        
        
    }
    
    
}
