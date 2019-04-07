//
//  ViewController.swift
//  DVNTAlertManager
//
//  Created by Raúl Vidal Muiños on 04/07/2019.
//  Copyright (c) 2019 Raúl Vidal Muiños. All rights reserved.
//

import UIKit
import DVNTAlertManager

class ViewController: UIViewController
{
    fileprivate let alertManager = DVNTAlertManager.shared
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.alertManager.setInkColor(.white)
        self.alertManager.setBaseColor(.green)
    }
    
    // MARK: - IBActions
    
    @IBAction func showIOSStyledAlertButtonAction(_ sender: Any)
    {
        self.alertManager.setAlertStyle(.iOS)
        self.alertManager.showBasicAlert(title: "Hey", message: "This is an iOS styled alert")
    }
    
    @IBAction func showMaterialStyledAlertButtonAction(_ sender: Any)
    {
        self.alertManager.setAlertStyle(.Android)
        self.alertManager.showBasicAlert(title: "Hey", message: "This is a Material styled alert")
    }
    
    @IBAction func showiOSLoadingIndicator(_ sender: Any)
    {
        self.alertManager.setAlertStyle(.iOS)
        self.alertManager.showLoadingView(isUserinteractionEnabled: false)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.alertManager.hideLoadingView()
        }
    }
    
    @IBAction func showMaterialLoadingIndicator(_ sender: Any)
    {
        self.alertManager.setAlertStyle(.Android)
        self.alertManager.showLoadingView(isUserinteractionEnabled: false)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.alertManager.hideLoadingView()
        }
    }
}

