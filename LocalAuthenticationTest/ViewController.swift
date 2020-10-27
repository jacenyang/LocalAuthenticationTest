//
//  ViewController.swift
//  LocalAuthenticationTest
//
//  Created by Jason Yang on 28/10/20.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didPressedAuthenticate(_ sender: UIButton) {
        
        let context = LAContext()
        let reason = "Authenticate"
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason, reply: { (successful, error) in
                if successful {
                    DispatchQueue.main.async {
                        self.statusLabel.text = "Authenticated"
                    }
                }
                else {
                    DispatchQueue.main.async {
                        self.statusLabel.text = "Authentication failed"
                    }
                }
            })
            
        }
        
        else {
            statusLabel.text = "Device not supported"
        }
        
    }

}

