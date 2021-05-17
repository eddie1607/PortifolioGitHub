//
//  ViewController.swift
//  alamofireSimple
//
//  Created by Edmilson vieira da silva on 12/05/21.
//  Copyright © 2021 Edmilson vieira da silva. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
   let imageView: UIImageView = {
       let imageView = UIImageView()
       imageView.translatesAutoresizingMaskIntoConstraints = false
       imageView.contentMode = .scaleAspectFill
       return imageView
   }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor)
            
        ])
        //alamofirePOST()
        //alamofirePUT()
        //alamofireDELETE()
        //alamofireParametros()
        //alamofireHTTPHEADER()
        //alamofireHTTPHEADER_combinandoParametros()
        //alamofireURLCREDENTIALS()
        //alamofireResponseJSON()
        //alamofireResponseData()
        //alamofireResponseString()
        //alamofireResponseDECODABLE()
        //alamofireDOWNLOADIMAGE()
        //alamofireDOWNLOADFILE()
        //alamofireUPLOADFILE()
        //alamofireUPLOAD_MULTIPARTFORMS()
        alamorireUPLOAD_SIMPLE()
    }
    
    


}
//MARK:- testando as principais funcoes de Alamofire
extension ViewController{
   
    func alamofireGET (){
        AF.request("https://httpbin.org/get").response{ response in
            debugPrint(response)
        }
    }
    func alamofirePOST(){
        // POST
        AF.request("https://httpbin.org/post", method: .post).response{
            response in debugPrint(response)
        }
    }
    func alamofirePUT(){
        // PUT
        AF.request("https://httpbin.org/put", method: .put).response{ response in
            debugPrint(response)
        }
    }
    func alamofireDELETE(){
        // DELETE
        AF.request("https://httpbin.org/delete", method: .delete).response{
            response in
            debugPrint(response)
        }
    }
    
    func alamofireParametros(){
        let parameters = ["category": "Movies", "genre": "Action"]

                    AF.request ("https://httpbin.org/get", parameters: parameters) .response {response in
                    debugPrint (response)
                    }
        // isso é equivalente a https://httpbin.org/get?category=Movies&genre=Action
    }
    func alamofireHTTPHEADER(){
        let headers: HTTPHeaders = [
            .authorization(username: "test@email.com", password: "testpassword"),
            .accept("application/json")
        ]

        AF.request("https://httpbin.org/headers", headers: headers).responseJSON { response in
            debugPrint(response)
            
        }
    }
    func alamofireHTTPHEADER_combinandoParametros(){
       let headers: HTTPHeaders = [
                    .authorization(username: "test@email.com", password: "testpassword"),
                    .accept("application/json")
                ]

        let parameters = ["category": "Movies", "genre": "Action"]

        AF.request("https://httpbin.org/headers", parameters: parameters, headers: headers).responseJSON { response in
                    debugPrint(response)
                }
        
    }
    func alamofireURLCREDENTIALS(){
        // Normal way to authenticate using the .authenticate with username and password
        let user = "test@email.com"
        let password = "testpassword"

        AF.request("https://httpbin.org/basic-auth/\(user)/\(password)")
                    .authenticate(username: user, password: password)
                    .responseJSON { response in
                        debugPrint(response)
                    }

            // Authentication using URLCredential

        let credential = URLCredential(user: user, password: password, persistence: .forSession)
                
                AF.request("https://httpbin.org/basic-auth/\(user)/\(password)")
                    .authenticate(with: credential)
                    .responseJSON { response in
                    debugPrint(response)
                    }
    }
    
    func alamofireResponseJSON(){
        AF.request("https://httpbin.org/get").responseJSON { response in
            debugPrint("Response: \(response)")
        }
    }
    func alamofireResponseData(){
        AF.request("https://httpbin.org/get").responseData { response in
            debugPrint("Response: \(response)")
        }
    }
    func alamofireResponseString(){
      AF.request("https://httpbin.org/get").responseString { response in
            debugPrint("Response: \(response)")
        }

    }
    func alamofireResponseDECODABLE(){
        struct HTTPBinResponse: Decodable { let url: String }

        AF.request("https://httpbin.org/get").responseDecodable(of: HTTPBinResponse.self) { response in
                 debugPrint("Response: \(response)")
        }
    }
    
    //Busca básica de uma imagem pela memória, ela não é salva e precisará ser carregada novamente se for buscada novamente
    func alamofireDOWNLOADIMAGE(){
        AF.download("https://httpbin.org/image/png").responseData { response in
        if let data = response.value {
            self.imageView.image = UIImage(data: data)
        }
        }
    }
    //baixar arquivos localmente  para facilitar o acesso:  para carregamento mais rápido como um cache:
    func alamofireDOWNLOADFILE(){
        let destination: DownloadRequest.Destination = { _, _ in
            let documentsURL = FileManager.default.urls(for: .picturesDirectory, in: .userDomainMask)[0]
                let fileURL = documentsURL.appendingPathComponent("image.png")

                return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
        }

        AF.download("https://httpbin.org/image/png", to: destination).response { response in
            debugPrint(response)

            if response.error == nil, let imagePath = response.fileURL?.path {
                let image = UIImage(contentsOfFile: imagePath)
            }
        }
        /* resultdado visualizado em :
         success(Optional(file:///Users/edmilson/Library/Developer/CoreSimulator/Devices/82C5F775-9214-48E4-8897-C1FD65D76B77/data/Containers/Data/Application/5630D897-3BCA-4334-BDEE-B00642CA3A2A/Pictures/image.png*/
    }
    func alamofireUPLOADFILE(){
        let data = Data("data".utf8)
        AF.upload(data, to: "https://httpbin.org/post").responseJSON { response in
            debugPrint(response)
        }
    }
    func alamofireUPLOAD_MULTIPARTFORMS(){
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(Data("one".utf8), withName: "one")
            multipartFormData.append(Data("two".utf8), withName: "two")
        }, to: "https://httpbin.org/post")
            .responseJSON { response in
                debugPrint(response)
        }
    }
    func alamorireUPLOAD_SIMPLE(){
        let fileURL = Bundle.main.url(forResource: "video", withExtension: "mp4")!

        AF.upload(fileURL, to: "https://httpbin.org/post").responseJSON { response in
            debugPrint(response)
        }
    }
}

