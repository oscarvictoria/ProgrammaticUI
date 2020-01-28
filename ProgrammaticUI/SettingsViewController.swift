//
//  SettingsViewController.swift
//  ProgrammaticUI
//
//  Created by Oscar Victoria Gonzalez  on 1/28/20.
//  Copyright © 2020 Oscar Victoria Gonzalez . All rights reserved.
//

import UIKit

struct AppKey {
    static let appColorKey = "App color"
    static let appColorIndex = ""
}

class SettingsViewController: UIViewController {
    
    private var settingsVC = SettingsView()
    
    var colorNames = ["Yellow", "Red", "Blue", "Green", "White"]
    
    var color: String?
    
 
    
    override func loadView() {
        view = settingsVC
        settingsVC.pickerView.dataSource = self
        settingsVC.pickerView.delegate = self
        color = colorNames.first
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        saveColor()
        saveColor()
    }
    
    
    func saveColor() {
          if let colorName = UserDefaults.standard.object(forKey: AppKey.appColorKey) as? String, let index = UserDefaults.standard.object(forKey: AppKey.appColorIndex) as? Int {
              view.backgroundColor = UIColor(named: colorName)
                settingsVC.pickerView.selectRow(index, inComponent: 0, animated: true)
          }
      }
    
    
    
//    func saveColor() {
//        let index = settingsVC.pickerView.selectedRow(inComponent: 0)
//        let color = colorNames[index]
//        view.backgroundColor = UIColor(named: color)
//    }

}

extension SettingsViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colorNames.count
    }
    
   
}

extension SettingsViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colorNames[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let color = colorNames[row]
        
        
        
        view.backgroundColor = UIColor(named: color)
        
        UserDefaults.standard.set(color, forKey: AppKey.appColorKey)
        UserDefaults.standard.set(row, forKey: AppKey.appColorIndex)
    }
}
