//
//  ViewController.swift
//  AutoLayoutProgramatico
//
//  Created by Edmilson vieira da silva on 19/05/21.
//  Copyright © 2021 Edmilson vieira da silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // cria quatro objetos de visualização para representar os elementos em nossa supervisão
    let topBar = UIView()
    let middleFrameTop = UIView()
    let middleFrameBottom = UIView()
    let bottomBar = UIView()
    var viewConstraints = [NSLayoutConstraint]() /// deve conter  todas as contrains  que deverao ser ativdas
    var viewsDict: [String : Any] = [:] /// contem todos os itens  adicionados a subview
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // define a cor de fundo dessas subvisualizações
        topBar.backgroundColor = .gray
        middleFrameTop.backgroundColor = .orange
        middleFrameBottom.backgroundColor = .blue
        bottomBar.backgroundColor = .darkGray
        //adicione subview a view principal
        self.view.addSubview(topBar)
        self.view.addSubview(middleFrameTop)
        self.view.addSubview(middleFrameBottom)
        self.view.addSubview(bottomBar)
        // remova quaisquer restrições
        topBar.translatesAutoresizingMaskIntoConstraints = false
        middleFrameTop .translatesAutoresizingMaskIntoConstraints = false
        middleFrameBottom.translatesAutoresizingMaskIntoConstraints = false
        bottomBar.translatesAutoresizingMaskIntoConstraints = false
        
        //dicionarios de itens apresentados no subview
        self.viewsDict =  ["topBar":topBar,"middleFrameTop":middleFrameTop,"middleFrameBottom":middleFrameBottom,"bottomBar":bottomBar];
        //definindo as constraints via visual format
        constraintsHorizontais()
        constraintsVerticais()
        
        ///carregando as constrains definidas no visual format
        NSLayoutConstraint.activate(viewConstraints)
        
    }
    func constraintsHorizontais (){
        ///constrains horizontais
        let topBarConstraintsHorizontal = NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[topBar]-16-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDict)
               viewConstraints += topBarConstraintsHorizontal
        let middleFrameTopHorizontal = NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[middleFrameTop]-16-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDict)
               viewConstraints += middleFrameTopHorizontal
               
        let middleFrameBottomHorizontal = NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[middleFrameBottom]-16-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views:viewsDict)
               viewConstraints += middleFrameBottomHorizontal
              
        let bottomBarHorizontal = NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[bottomBar]-16-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDict)
               viewConstraints += bottomBarHorizontal
              
    }
    func constraintsVerticais(){
        ///constraints verticais
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-40-[topBar]-16-[middleFrameTop(==topBar)]-16-[middleFrameBottom(==topBar)]-16-[bottomBar(==topBar)]-20-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDict)
        viewConstraints += verticalConstraints
        
    }


}

