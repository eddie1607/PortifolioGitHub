//
//  CursoTestesUnitTests.swift
//  CursoTestesUnitTests
//
//  Created by Edmilson vieira da silva on 14/12/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import XCTest
@testable import CursoTestesUnit

class CursoTestesUnitTests: XCTestCase {

    override func setUpWithError() throws {
      
      // prepara as classes  setar as variaveis
      // sempre é chamado antes de executar um teste
      print("1")
      
    }

    override func tearDownWithError() throws {
        //  Limpa as  variaveis  apos  execsucao do teste
      print("3")
    }

    func testExample() throws {
        // executa  os testes
       print("2")
      XCTAssert( 1+1 == 2)
    }
  func testExample2() throws {
       // executa  os testes
      print("2")
     XCTAssert( 1+1 == 2)
   }


}
