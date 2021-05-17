//
//  Interfaces.swift
//  MVVMDelegate
//
//  Created by Edmilson vieira da silva on 13/02/21.
//  Copyright © 2021 Edmilson vieira da silva. All rights reserved.
//

import Foundation

//regras de visualizacao
protocol ViewModelDelegate: class {
    func willLoadData()
    func didLoadData()
}

protocol ViewModelType {
    func bootstrap() //inicializacao
    var delegate: ViewModelDelegate? { get set } //comunicacao com a view
}
