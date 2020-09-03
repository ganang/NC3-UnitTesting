//
//  VideoCollectionPresenter.swift
//  viper-unit-testing
//
//  Created by Ganang Arief Pratama on 03/09/20.
//  Copyright © 2020 ganang.id. All rights reserved.
//

import UIKit

class VideoCollectionPresenter: VideoCollectionPresenterProtocol {
    var interactor: VideoCollectionInteractorProtocol?
    weak var view: VideoCollectionViewControllerProtocol?
    var wireframe: VideoCollectionWireframeProtocol?
    
    func getCollections(_ params: [String : Any]) {
        interactor?.getCollections(params)
    }
    
    func displayVideos(_ videos: [VideoModel]) {
        view?.displayVideos(videos)
    }
}

