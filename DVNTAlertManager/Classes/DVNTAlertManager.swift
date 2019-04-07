//
//  DVNTAlertManager.swift
//
//
//  Created by Raúl Vidal Muiños on 7/4/19.
//  Copyright © 2019 Devinet 2013, S.L.U. All rights reserved.
//

import DVNTStringExtension
import DVNTUIWindowExtension
import MaterialComponents.MaterialDialogs
import MaterialComponents.MaterialActivityIndicator

public enum AlertStyleType
{
    case iOS
    case Android
}

public class DVNTAlertManager
{
    public static let shared = DVNTAlertManager()
    
    fileprivate var loadingView: UIView?
    fileprivate var inkColor: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    fileprivate var baseColor: UIColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    fileprivate var alertStyle: AlertStyleType = .iOS
    fileprivate var isShowingLoadingView: Bool = false
    fileprivate var loadingViewBackgroundColor: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.7)
    
    private init()
    { }
    
    // MARK: - Setters
    
    public func setAlertStyle(_ style: AlertStyleType)
    {
        self.alertStyle = style
    }
    
    public func setBaseColor(_ color: UIColor)
    {
        self.baseColor = color
    }
    
    public func setInkColor(_ color: UIColor)
    {
        self.inkColor = color
    }
    
    public func setLoadingViewBackgroundColor(_ color: UIColor)
    {
        self.loadingViewBackgroundColor = color
    }
    
    // MARK: - Show alert methods
    
    public func showLoadingView(isUserinteractionEnabled: Bool)
    {
        if !self.isShowingLoadingView {
            DispatchQueue.main.async {
                if let keyWindow = UIApplication.shared.keyWindow {
                    keyWindow.getVisibleViewController(completed: {(currentViewController) -> Void in
                        if let currentViewController = currentViewController {
                            if self.loadingView == nil {
                                let currentViewframe = currentViewController.view.bounds
                                self.loadingView = UIView(frame: CGRect(x: ((currentViewframe.width / 2) - (50 / 2)), y: ((currentViewframe.height / 2) - (50 / 2)), width: 50.0, height: 50.0))
                                if let loadingView = self.loadingView {
                                    loadingView.backgroundColor = self.loadingViewBackgroundColor
                                    loadingView.layer.cornerRadius = 4
                                }
                            }
                            
                            if let loadingView = self.loadingView {
                                if self.alertStyle == .Android {
                                    var found = false
                                    for view in loadingView.subviews {
                                        if view is MDCActivityIndicator {
                                            let activityIndicator = view as! MDCActivityIndicator
                                            activityIndicator.startAnimating()
                                            found = true
                                            break
                                        }
                                    }
                                    if !found {
                                        let activityIndicator = MDCActivityIndicator()
                                        activityIndicator.cycleColors = [self.baseColor, self.inkColor]
                                        activityIndicator.frame = CGRect(x: ((loadingView.frame.width / 2) - (activityIndicator.frame.width / 2)), y: ((loadingView.frame.height / 2) - (activityIndicator.frame.height / 2)), width: activityIndicator.frame.width, height: activityIndicator.frame.height)
                                        loadingView.addSubview(activityIndicator)
                                        activityIndicator.startAnimating()
                                    }
                                }else{
                                    var found = false
                                    for view in loadingView.subviews {
                                        if view is UIActivityIndicatorView {
                                            let activityIndicator = view as! UIActivityIndicatorView
                                            activityIndicator.startAnimating()
                                            found = true
                                            break
                                        }
                                    }
                                    if !found {
                                        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
                                        activityIndicator.color = self.baseColor
                                        activityIndicator.frame = CGRect(x: ((loadingView.frame.width / 2) - (activityIndicator.frame.width / 2)), y: ((loadingView.frame.height / 2) - (activityIndicator.frame.height / 2)), width: activityIndicator.frame.width, height: activityIndicator.frame.height)
                                        loadingView.addSubview(activityIndicator)
                                        activityIndicator.startAnimating()
                                    }
                                }
                                
                                self.isShowingLoadingView = true
                                currentViewController.view.addSubview(loadingView)
                                keyWindow.isUserInteractionEnabled = isUserinteractionEnabled
                            }
                        }
                    })
                }
            }
        }
    }
    
    public func hideLoadingView()
    {
        if self.isShowingLoadingView {
            if let keyWindow = UIApplication.shared.keyWindow, let loadingView = self.loadingView {
                if self.alertStyle == .Android {
                    for view in loadingView.subviews {
                        if view is MDCActivityIndicator {
                            let activityIndicator = view as! MDCActivityIndicator
                            activityIndicator.stopAnimating()
                            break
                        }
                    }
                }else{
                    for view in loadingView.subviews {
                        if view is UIActivityIndicatorView {
                            let activityIndicator = view as! UIActivityIndicatorView
                            activityIndicator.stopAnimating()
                            break
                        }
                    }
                }
                loadingView.removeFromSuperview()
                keyWindow.isUserInteractionEnabled = true
                self.isShowingLoadingView = false
            }
        }
    }
    
    public func showBasicAlert(title: String, message: String)
    {
        DispatchQueue.main.async {
            if let keyWindow = UIApplication.shared.keyWindow {
                keyWindow.getVisibleViewController(completed: {(currentViewController) -> Void in
                    if let currentViewController = currentViewController {
                        if self.alertStyle == .Android {
                            let alertController = MDCAlertController(title: title, message: message)
                            alertController.buttonTitleColor = self.baseColor
                            alertController.buttonInkColor = self.inkColor
                            
                            
                            let path = Bundle(for: DVNTAlertManager.self).path(forResource: "DVNTAlertManagerResources", ofType: "bundle")!
                            let bundle = Bundle(path: path) ?? Bundle.main
                            let text = NSLocalizedString("general_ok", bundle: bundle, comment: "").capitalized
                            print("TEXT: \(text)")
                            
                            alertController.addAction(MDCAlertAction(title:text))
                            currentViewController.present(alertController, animated: true, completion: nil)
                        }else{
                            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                            alertController.addAction(UIAlertAction(title: String.localize("general_ok").capitalized, style: .default))
                            currentViewController.present(alertController, animated: true, completion: nil)
                        }
                    }
                })
            }
        }
    }
    
    public func showBasicAlertWithAction(title: String, message: String, buttonTouched: @escaping (Int) -> Void)
    {
        DispatchQueue.main.async {
            if let keyWindow = UIApplication.shared.keyWindow {
                keyWindow.getVisibleViewController(completed: {(currentViewController) -> Void in
                    if let currentViewController = currentViewController {
                        if self.alertStyle == .Android {
                            let alertController = MDCAlertController(title: title, message: message)
                            alertController.buttonTitleColor = self.baseColor
                            alertController.buttonInkColor = self.inkColor
                            alertController.addAction(MDCAlertAction(title: String.localize("general_ok").capitalized) { (action) in buttonTouched(0) })
                            currentViewController.present(alertController, animated: true, completion: nil)
                        }else{
                            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                            alertController.addAction(UIAlertAction(title: String.localize("general_ok").capitalized, style: .default) { (action) in buttonTouched(0) })
                            currentViewController.present(alertController, animated: true, completion: nil)
                        }
                    }
                })
            }
        }
    }
    
    public func showAlertWithTwoOptions(title: String, message: String, buttonActionText: String, cancelButtonText: String, buttonTouched: @escaping (Int) -> Void)
    {
        DispatchQueue.main.async {
            if let keyWindow = UIApplication.shared.keyWindow {
                keyWindow.getVisibleViewController(completed: {(currentViewController) -> Void in
                    if let currentViewController = currentViewController {
                        if self.alertStyle == .Android {
                            let alertController = MDCAlertController(title: title, message: message)
                            alertController.buttonTitleColor = self.baseColor
                            alertController.buttonInkColor = self.inkColor
                            alertController.addAction(MDCAlertAction(title: buttonActionText) { (action) in buttonTouched(0) })
                            alertController.addAction(MDCAlertAction(title: cancelButtonText) { (action) in buttonTouched(1) })
                            currentViewController.present(alertController, animated: true, completion: nil)
                        }else{
                            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                            alertController.addAction(UIAlertAction(title: buttonActionText, style: .default) { (action) in buttonTouched(0) })
                            alertController.addAction(UIAlertAction(title: cancelButtonText, style: .destructive) { (action) in buttonTouched(1) })
                            currentViewController.present(alertController, animated: true, completion: nil)
                        }
                    }
                })
            }
        }
    }
    
    public func showAlertWithThreeOptions(title: String, message: String, buttonActionText: String, buttonAction2Text: String, cancelButtonText: String, buttonTouched: @escaping (Int) -> Void)
    {
        DispatchQueue.main.async {
            if let keyWindow = UIApplication.shared.keyWindow {
                keyWindow.getVisibleViewController(completed: {(currentViewController) -> Void in
                    if let currentViewController = currentViewController {
                        if self.alertStyle == .Android {
                            let alertController = MDCAlertController(title: title, message: message)
                            alertController.buttonTitleColor = self.baseColor
                            alertController.buttonInkColor = self.inkColor
                            alertController.addAction(MDCAlertAction(title: buttonActionText) { (action) in buttonTouched(0) })
                            alertController.addAction(MDCAlertAction(title: buttonAction2Text) { (action) in buttonTouched(1) })
                            alertController.addAction(MDCAlertAction(title: cancelButtonText) { (action) in buttonTouched(2) })
                            currentViewController.present(alertController, animated: true, completion: nil)
                        }else{
                            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                            alertController.addAction(UIAlertAction(title: buttonActionText, style: .default) { (action) in buttonTouched(0) })
                            alertController.addAction(UIAlertAction(title: buttonAction2Text, style: .default) { (action) in buttonTouched(1) })
                            alertController.addAction(UIAlertAction(title: cancelButtonText, style: .destructive) { (action) in buttonTouched(2) })
                            currentViewController.present(alertController, animated: true, completion: nil)
                        }
                    }
                })
            }
        }
    }
    
    public func showAlertWithTextField(title: String, message: String, textFieldPlaceholder: String, buttonActionText: String, cancelButtonText: String, buttonTouched: @escaping (String) -> Void)
    {
        DispatchQueue.main.async {
            if let keyWindow = UIApplication.shared.keyWindow {
                keyWindow.getVisibleViewController(completed: {(currentViewController) -> Void in
                    if let currentViewController = currentViewController {
                        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                        alertController.addTextField(configurationHandler: { textField in
                            textField.placeholder = textFieldPlaceholder
                        })
                        
                        alertController.addAction(UIAlertAction(title: cancelButtonText, style: .cancel, handler: nil))
                        alertController.addAction(UIAlertAction(title: buttonActionText, style: .default, handler: { action in
                            if let text = alertController.textFields?.first?.text {
                                if text.isEmpty == false {
                                    buttonTouched(text)
                                }
                            }
                        }))
                        currentViewController.present(alertController, animated: true, completion: nil)
                    }
                })
            }
        }
    }
}
