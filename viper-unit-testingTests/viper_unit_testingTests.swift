//
//  viper_unit_testingTests.swift
//  viper-unit-testingTests
//
//  Created by Ganang Arief Pratama on 03/09/20.
//  Copyright © 2020 ganang.id. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import viper_unit_testing

class viper_unit_testingTests: XCTestCase {

    func testVideoGetCollectionWithExpectedURLHostAndPath() {
        XCTAssertEqual(Network.baseURLString, "https://podcast.ganangariefp.xyz")
    }
    
    func testGetVideoCollectionSuccessReturnsVideos() {
        let videoCollectionWorker = VideoCollectionWorker()
        let params: [String: Any] = ["uid": "000162.8e7c7038d98a4c57a6be27e4906402be.1511"]
        
        let videosExpectation = expectation(description: "videos")
        var videosResponse: [VideoModel]?
        
        videoCollectionWorker.getCollections(onSuccess: { (videos) in
            videosResponse = videos
            videosExpectation.fulfill()
        }, onFailed: { (error) in
        }, params)
        
        waitForExpectations(timeout: 1) { (error) in
            XCTAssertNotNil(videosResponse)
        }
    }
    
    func testGetVideoCollectionWhenResponseErrorReturnsError() {
        let videoCollectionWorker = VideoCollectionWorker()
        let params: [String: Any] = ["uid": "000162.8e7c7038d98a4c57a6be27e4906402be"]
        
        let errorExpectation = expectation(description: "error")
        var errorResponse: String?
        
        videoCollectionWorker.getCollections(onSuccess: { (videos) in
        }, onFailed: { (error) in
            errorResponse = error
            errorExpectation.fulfill()
        }, params)
        
        waitForExpectations(timeout: 1) { (error) in
            XCTAssertNotNil(errorResponse)
        }
    }
    
    func testGetVideoCollectionEmptyDataReturnsError() {
        let videoCollectionWorker = VideoCollectionWorker()
        let videosResponseJSON: JSON = JSON("")
        
        let errorExpectation = expectation(description: "error")
        var errorResponse: String?
        
        videoCollectionWorker.changeJSONToVideoModel(json: videosResponseJSON, onSuccess: { (videos) in
        }) { (error) in
            errorResponse = error
            errorExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 1) { (error) in
            XCTAssertNotNil(errorResponse)
        }
    }
    
    func testGetVideoCollectionInvalidJSONReturnsError() {
        let videoCollectionWorker = VideoCollectionWorker()
        let videosResponseJSON: JSON = JSON("[{\"xxx\"}]")
        
        let errorExpectation = expectation(description: "error")
        var errorResponse: String?
        
        videoCollectionWorker.changeJSONToVideoModel(json: videosResponseJSON, onSuccess: { (videos) in
        }) { (error) in
            errorResponse = error
            errorExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 1) { (error) in
            XCTAssertNotNil(errorResponse)
        }
    }

}
