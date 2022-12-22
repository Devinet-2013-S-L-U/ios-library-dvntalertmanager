//
//  DVNTUIWindowExtension.swift
//  DVNTUIWindowExtension
//
//  Created by Raúl Vidal Muiños on 06/04/2019.
//

import UIKit

extension UIWindow
{
    public func getVisibleViewController(completed: @escaping (UIViewController?) -> Void)
    {
        DispatchQueue.main.async {
            if let window = UIApplication.shared.mainKeyWindow, let presentedViewController = window.rootViewController {
                completed(self.getVisibleViewControllerFrom(vc: presentedViewController))
            }else{
                completed(nil)
            }
        }
    }
    
    fileprivate func getVisibleViewControllerFrom(vc: UIViewController) -> UIViewController?
    {
        switch(vc) {
        case is UINavigationController:
            if let navigationController = vc as? UINavigationController, let visibleViewController = navigationController.visibleViewController {
                return self.getVisibleViewControllerFrom(vc: visibleViewController)
            }
            return nil
        case is UITabBarController:
            if let tabBarController = vc as? UITabBarController, let selectedViewController = tabBarController.selectedViewController {
                return self.getVisibleViewControllerFrom(vc: selectedViewController)
            }
            return nil
        default:
            if let presentedViewController = vc.presentedViewController {
                if let presentedViewController2 = presentedViewController.presentedViewController {
                    return self.getVisibleViewControllerFrom(vc: presentedViewController2)
                }else{
                    return vc
                }
            }else{
                return vc
            }
        }
    }
}
