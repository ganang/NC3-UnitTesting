//
//  VideoCollectionProtocol.swift
//  viper-unit-testing
//
//  Created by Ganang Arief Pratama on 03/09/20.
//  Copyright © 2020 ganang.id. All rights reserved.
//

import UIKit

protocol VideoCollectionViewControllerProtocol: class {
    func displayVideos(_ videos: [VideoModel])
}

protocol VideoCollectionPresenterProtocol: class {
    var interactor: VideoCollectionInteractorProtocol? { get set }
    var view: VideoCollectionViewControllerProtocol? { get set }
    var wireframe: VideoCollectionWireframeProtocol? { get set }
    
    func getCollections(_ params: [String: Any])
    func displayVideos(_ videos: [VideoModel])
}

protocol VideoCollectionInteractorProtocol: class {
    var presenter: VideoCollectionPresenterProtocol? { get set }
    
    func getCollections(_ params: [String: Any])
}

protocol VideoCollectionWireframeProtocol: class {
    
}
