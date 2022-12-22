//
//  DVNTStringExtension.swift
//
//
//  Created by Raúl Vidal Muiños on 22/12/22.
//  Copyright © 2022 Devinet 2013, S.L.U. All rights reserved.
//

import UIKit

extension UIApplication {
    var mainKeyWindow: UIWindow? {
        get {
            if #available(iOS 13, *) {
                return connectedScenes
                    .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                    .first { $0.isKeyWindow }
            } else {
                return keyWindow
            }
        }
    }
}
