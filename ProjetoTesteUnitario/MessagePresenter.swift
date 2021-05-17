//
//  MessagePresenter.swift
//  ProjetoTesteUnitario
//
//  Created by Edmilson vieira da silva on 11/12/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import Foundation
import UIKit

protocol MessagePresenter {
    
    func presentMessage(_ message: String, on viewController: UIViewController)
    
}

