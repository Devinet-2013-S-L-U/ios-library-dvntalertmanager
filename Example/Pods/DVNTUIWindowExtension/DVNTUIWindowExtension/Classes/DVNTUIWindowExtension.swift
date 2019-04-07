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
        DispatchQueue.main.async{
            if let rootViewController: UIViewController = self.rootViewController {
                completed(self.getVisibleViewControllerFrom(vc: rootViewController))
            }else{
                completed(nil)
            }
        }
    }
    
    fileprivate func getVisibleViewControllerFrom(vc:UIViewController) -> UIViewController
    {
        switch(vc) {
        case is UINavigationController:
            let navigationController = vc as! UINavigationController
            return self.getVisibleViewControllerFrom( vc: navigationController.visibleViewController!)
        case is UITabBarController:
            let tabBarController = vc as! UITabBarController
            return self.getVisibleViewControllerFrom(vc: tabBarController.selectedViewController!)
        default:
            if let presentedViewController = vc.presentedViewController {
                if let presentedViewController2 = presentedViewController.presentedViewController {
                    return self.getVisibleViewControllerFrom(vc: presentedViewController2)
                }
                else{
                    return vc
                }
            }
            else{
                return vc
            }
        }
    }
}
