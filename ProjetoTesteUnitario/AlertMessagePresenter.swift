//
//  AlertMessagePresenter.swift
//  ProjetoTesteUnitario
//
//  Created by Edmilson vieira da silva on 11/12/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import Foundation
import UIKit

class AlertMessagePresenter: MessagePresenter {
    
    func presentMessage(_ message: String, on viewController: UIViewController) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        viewController.present(alert, animated: true, completion: nil)
    }
    
}
