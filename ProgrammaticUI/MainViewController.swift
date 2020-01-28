//
//  ViewController.swift
//  ProgrammaticUI
//
//  Created by Oscar Victoria Gonzalez  on 1/28/20.
//  Copyright © 2020 Oscar Victoria Gonzalez . All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private var mainView = MainView()
    
    // if doing programmtic UI implement and setup the view in loadView()
    // loadView() gets called befor viewDidLoad
    // loadView() sets up the initial view of the controller
    //
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
        configureNavBar()
        
        // add target action for the reset button
        mainView.resetButton.addTarget(self, action: #selector(restAppColor(sender:)) , for: .touchUpInside)
        
    }
    
    func configureNavBar() {
        navigationItem.title = "Programmatic UI"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(showSettings(_:)))
    }
    
    @objc
    private func showSettings(_ semder: UIBarButtonItem) {
        // segue to the SettingsViewController
        let settingsVC = SettingsViewController()
        //    present(settingsVC, animated: true)
        navigationController?.pushViewController(settingsVC, animated: true)
        
    }
    
    @objc
    private func restAppColor(sender: UIButton) {
        view.backgroundColor = .systemBackground
        
    }
    
}

