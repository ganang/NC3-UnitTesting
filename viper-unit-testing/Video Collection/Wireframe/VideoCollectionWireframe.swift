//
//  VideoCollectionWireframe.swift
//  viper-unit-testing
//
//  Created by Ganang Arief Pratama on 03/09/20.
//  Copyright © 2020 ganang.id. All rights reserved.
//

class VideoCollectionWireframe: VideoCollectionWireframeProtocol {
    class func createMainModule(videoCollectionRef: VideoCollectionViewController) {
        let presenter: VideoCollectionPresenterProtocol = VideoCollectionPresenter()
        
        videoCollectionRef.presenter = presenter
        videoCollectionRef.presenter?.wireframe = VideoCollectionWireframe()
        videoCollectionRef.presenter?.view = videoCollectionRef
        videoCollectionRef.presenter?.interactor = VideoCollectionInteractor()
        videoCollectionRef.presenter?.interactor?.presenter = presenter
    }
}
