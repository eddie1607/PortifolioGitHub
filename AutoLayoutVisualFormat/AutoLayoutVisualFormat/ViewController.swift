//
//  ViewController.swift
//  AutoLayoutVisualFormat
//
//  Created by Edmilson vieira da silva on 19/05/21.
//  Copyright © 2021 Edmilson vieira da silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let label: UILabel = {
        //aqui estamos trabalhando com conceito de frame
       // let lb = UILabel(frame: CGRect(x: 10, y: 10, width: 200, height: 80))
        //1 passo criar  uma view normal
        let lb = UILabel()
        lb.textColor = .white
        lb.textAlignment = NSTextAlignment.center
        lb.text = "UILabel for text ..."
        //2-passo
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.backgroundColor = .blue
        
        return lb
    }()
    
    let label2: UILabel = {
        //aqui estamos trabalhando com conceito de frame
       // let lb = UILabel(frame: CGRect(x: 10, y: 10, width: 200, height: 80))
        //1 passo criar  uma view normal
        let lb = UILabel()
        lb.textColor = .white
        lb.textAlignment = NSTextAlignment.center
        lb.text = "UILabel for text ..."
        //2-passo
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.backgroundColor = .blue
        
        return lb
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        view.addSubview(label)
        view.addSubview(label2)
        label.center = view.center
        //2 - passo
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0(50)]-10-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": label]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0(50)]-10-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": label2]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[v0(v1)]-8-[v1]-15-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0" : label,"v1":label2]))
    }


}

