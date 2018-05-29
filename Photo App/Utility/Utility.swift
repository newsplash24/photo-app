//
//  Utility.swift
//  Photo App
//
//  Created by Mohamed Hamed on 5/29/18.
//  Copyright © 2018 Mohamed Hamed. All rights reserved.
//

import Foundation
import UIKit

class Utility {
    
    static func showAlert(controller: UIViewController, title: String, message: String, buttonTitle: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
        alert.popoverPresentationController?.sourceView = controller.view
        alert.popoverPresentationController?.sourceRect = controller.view.bounds
        controller.present(alert, animated: true, completion: nil)
    }
    
}
