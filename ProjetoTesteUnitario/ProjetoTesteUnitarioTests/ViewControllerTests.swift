//
//  ViewControllerTests.swift
//  ProjetoTesteUnitarioTests
//
//  Created by Edmilson vieira da silva on 11/12/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import XCTest
@testable import ProjetoTesteUnitario //// para  importar o projeto a ser testado

// vai i nome da classe a ser testada
class ViewControllerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
      getViewController()
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
  func testLoading(){
    // arrange
    guard let  sut = getViewController() else {return}
    
    //Act
    _ = sut.view
    
    //assert
    XCTAssertNil(sut.messagePresenter, "seu presenter deveria ter sido inicializado")
    
  }
  
  func getViewController()-> ViewController? {
    
    guard let vc  = UIStoryboard.init(name:"Main", bundle:nil).instantiateViewController(withIdentifier: "SimpleVC") as? ViewController else{
      XCTAssert(false, "view nao identificada ")
      return nil
    }
    return vc
  }

}
