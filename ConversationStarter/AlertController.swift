//
//  AlertController.swift
//  ConversationStarter
//
//  Created by Ben Shockley on 3/4/17.
//  Copyright © 2017 Ben Shockley. All rights reserved.
//

import Foundation
import UIKit

class AlertController: UIViewController {
    
    func showStandardAlert(alertTitle: String, alertMessage: String) {
        
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
        
        var visibleVC = UIViewController()
        
        if navigationController == nil {
            visibleVC = (UIApplication.shared.keyWindow?.rootViewController)!
        } else if navigationController?.visibleViewController != nil {
            visibleVC = (navigationController?.visibleViewController!)!
        }
        
        visibleVC.present(alert, animated: true, completion: nil)
        
    
    }
}
