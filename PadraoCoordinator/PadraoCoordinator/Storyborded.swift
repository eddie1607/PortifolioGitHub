//
//  Storyborded.swift
//  PadraoCoordinator
//
//  Created by Edmilson vieira da silva on 04/03/21.
//  Copyright © 2021 Edmilson vieira da silva. All rights reserved.
//


//// facile instanciacao de storybord
import UIKit


protocol  Storyborded {

   static func instantiate() -> Self
}
extension  Storyborded  where Self: UIViewController{
  
  static func instantiate() -> Self{
    let fullName = NSStringFromClass(self)
    let className = fullName.components(separatedBy: ".")[1]
    let storybord = UIStoryboard(name: "main", bundle: Bundle.main)
    return storybord.instantiateViewController(identifier: className) as! Self
    
  }
}
