//
//  Loader.swift
//  Pixelate
//
//  Created by Taneja-Mac on 25/03/19.
//  Copyright © 2019 Taneja-Mac. All rights reserved.
//

import Foundation
import SwiftLoader

class Loader {
    static let shared: Loader = Loader()
    
    init() {
        var config: SwiftLoader.Config = SwiftLoader.Config()
        config.size = 110
        config.spinnerColor = UIColor(red: 0.157, green: 0.212, blue: 0.231, alpha: 1.00)
        config.foregroundColor = UIColor.clear
        SwiftLoader.setConfig(config: config)
    }
    func start() {
        DispatchQueue.main.async {
            SwiftLoader.show(animated: true)
        }
    }
    
    func start(_ title: String) {
        DispatchQueue.main.async {
            SwiftLoader.show(title: title, animated: true)
        }
    }
    
    func stop() {
        SwiftLoader.hide()
    }
}
