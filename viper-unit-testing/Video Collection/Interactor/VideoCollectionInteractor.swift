//
//  VideoCollectionInteractor.swift
//  viper-unit-testing
//
//  Created by Ganang Arief Pratama on 03/09/20.
//  Copyright © 2020 ganang.id. All rights reserved.
//

import UIKit

class VideoCollectionInteractor: VideoCollectionInteractorProtocol {
    
    weak var presenter: VideoCollectionPresenterProtocol?
    private var videoCollectionWorker = VideoCollectionWorker()
    
    func getCollections(_ params: [String: Any]) {
        videoCollectionWorker.getCollections(onSuccess: { (videoModels) in
            self.presenter?.displayVideos(videoModels)
        }, onFailed: { (error) in
//            self.presenter
        }, params)

    }
    
}
