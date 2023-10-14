//
//  BarRaiserSongListTest.swift
//  BarRaiserTests
//
//  Created by Farooque Azam on 14/10/23.
//

import XCTest

@testable import BarRaiser

let client = BarRaiserAPIManager()

final class BarRaiserSongListTest: XCTestCase {
    
    func testMockResponse(){

        let expextaion = expectation(description: "SongList")
        client.getDummyData(resultType: BarRaiserSongModel.self) { (data , error) in
            XCTAssertNil(error)
            XCTAssertNotNil(BarRaiserSongModel.self)
            expextaion.fulfill()

            
        }

        waitForExpectations(timeout: 10)
    }
    
}
