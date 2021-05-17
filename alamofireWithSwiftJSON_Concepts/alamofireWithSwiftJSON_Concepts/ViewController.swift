//
//  ViewController.swift
//  alamofireWithSwiftJSON_Concepts
//
//  Created by Edmilson vieira da silva on 13/05/21.
//  Copyright © 2021 Edmilson vieira da silva. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
   var Json :JSON = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getJSON_test()
       // getJSON_MATRIX()
        //getJSON_DICTIONARY()
       
    }


}
//Mark:- chamada de rede
extension ViewController{
     
    
    func getJSON_test (){
        AF.request("https://httpbin.org/json").responseJSON(completionHandler: { response in
            switch response.result{
                
            case .success(let value):
                let json = JSON(value)
                debugPrint(json)
                self.Json = json
                if let slideshow =  json ["slideshow"]["title"].string{
                    debugPrint(slideshow)
                }
                if let authors = json["slideshow"]["author"].string{
                    print("===========")
                    debugPrint(authors)
                }
            case .failure(let error):
                 print (error)
            }
        })
    }
    
    func getJSON_MATRIX(){
        AF.request("https://httpbin.org/json").responseJSON(completionHandler: { response in
            switch response.result{
                
            case .success(let value):
                
                let json = JSON(value)
                debugPrint("\n\n=====================")
                let slideTitles = json["slideshow"]["slides"].arrayValue.map({$0["title"].stringValue})
                    debugPrint(slideTitles)
                let slideType = json["slideshow"]["slides"].arrayValue.map({$0["type"].stringValue})
                    debugPrint(slideType)
                let slideItems = json["slideshow"]["slides"].arrayValue.map({$0["items"].count})
                    debugPrint(slideItems)
              // print( self.jsonIsNotDictionary(JSON(value)))
            case .failure(let error):
                 print(error)
            }
        })
    }
    func getJSON_DICTIONARY(){
        AF.request("https://httpbin.org/json").responseJSON(completionHandler: { response in
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                for (key,subjson):(String,JSON) in json["slideshow"]["slides"]{
                    debugPrint(key)
                    debugPrint(subjson)
                    
                    debugPrint(subjson["title"])
                    debugPrint(subjson["type"])
                    debugPrint(subjson["items"])
                    print( self.jsonIsNotDictionary(JSON(value)))
                }
                
            case .failure(let error):
                debugPrint(error)
            }
        })
    }
    // JSON não é um dicionário
    func jsonIsNotDictionary(_ json: JSON) -> Bool{
        if let name = json["name"].string {
            return true
        } else {
            print(json["title"])       // "Dictionary[\"name"] failure, It is not an dictionary"
            print(json["type"].error!) // "Dictionary[\"name"] failure, It is not an dictionary"
        }
        return false
    }
    
    // Erro de leitura JSON (formato incorreto)
    
    // A chave do dicionário não existe
    
   // Fora dos limites
    
}
