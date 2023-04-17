//
//  DVNTUIWindowExtension.swift
//  DVNTUIWindowExtension
//
//  Created by Raúl Vidal Muiños on 06/04/2019.
//

import UIKit

extension UIWindow
{
    public func getVisibleViewController(completed: @escaping (UIViewController?) -> Void) {
        DispatchQueue.main.async {
            if #available(iOS 13.0, *), let windowScene = self.windowScene, let mainWindow = windowScene.windows.first(where: { $0.isKeyWindow }),
                let presentedViewController = mainWindow.rootViewController {
                completed(self.getVisibleViewControllerFrom(vc: presentedViewController))
            } else {
                if let presentedViewController = self.rootViewController {
                    completed(self.getVisibleViewControllerFrom(vc: presentedViewController))
                } else {
                    completed(nil)
                }
            }
        }
    }
    
    fileprivate func getVisibleViewControllerFrom(vc: UIViewController) -> UIViewController? {
        if let navigationController = vc as? UINavigationController {
            if let visibleViewController = navigationController.visibleViewController {
                return self.getVisibleViewControllerFrom(vc: visibleViewController)
            }
            return navigationController
        }

        if let tabBarController = vc as? UITabBarController {
            if let selectedViewController = tabBarController.selectedViewController {
                return self.getVisibleViewControllerFrom(vc: selectedViewController)
            }
            return tabBarController
        }

        if let presentedViewController = vc.presentedViewController {
            return self.getVisibleViewControllerFrom(vc: presentedViewController)
        }

        if let splitViewController = vc as? UISplitViewController {
            if let lastViewController = splitViewController.viewControllers.last {
                return self.getVisibleViewControllerFrom(vc: lastViewController)
            }
            return splitViewController
        }

        if let pageViewController = vc as? UIPageViewController {
            if let viewControllers = pageViewController.viewControllers, viewControllers.count > 0 {
                return self.getVisibleViewControllerFrom(vc: viewControllers[0])
            }
            return pageViewController
        }

        return vc
    }
}
