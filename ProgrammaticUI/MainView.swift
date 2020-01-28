//
//  MainView.swift
//  ProgrammaticUI
//
//  Created by Oscar Victoria Gonzalez  on 1/28/20.
//  Copyright © 2020 Oscar Victoria Gonzalez . All rights reserved.
//

import UIKit

class MainView: UIView {
    
    let defaultMessage = "No default color set. Please go to settings"
    
    // create a label
    
    public lazy var messagelabel: UILabel =  { // lazy allows us to use instances before the body gets executed
        let label = UILabel()
        label.backgroundColor = .systemRed
        label.textAlignment = .center
        label.text = defaultMessage //
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    /*
     TODO: syntax terminology
     public var messagelabel: UILabel =  { // Does not compile
     let label = UILabel()
     label.text = defaultMessage //
     return label
     }()
     */
    
    
    
    
    // create a button
    
    public lazy var resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(.systemYellow, for: .normal)
        button.isEnabled = true
        
        return button
    }()
    
    
    
    // init(frame:) gets called if view is done programmatically
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    // if this view gets initiated from storyboard
    // this initializer gets called
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    private func commonInit() {
        setUpMessageLabel()
        setupResetButtonConstraints()
    }
    
    private func setUpMessageLabel() {
        // add the messsage label to the MainView
        addSubview(messagelabel) // retuns the messageLabel we created above
        // set contraints for the messageLabel
        messagelabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // set top anchor 20 points from the safe area top
            
            messagelabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            // set paddig at the leading edge of the Main
            messagelabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            // set padding at the trailing edge of the MainView
            messagelabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    private func setupResetButtonConstraints() {
        addSubview(resetButton)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [resetButton.centerXAnchor.constraint(equalTo: centerXAnchor),
             resetButton.topAnchor.constraint(equalTo: messagelabel.bottomAnchor, constant: 50)])
    }
}
