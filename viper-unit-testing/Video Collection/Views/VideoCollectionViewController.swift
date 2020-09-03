//
//  ViewController.swift
//  viper-unit-testing
//
//  Created by Ganang Arief Pratama on 03/09/20.
//  Copyright © 2020 ganang.id. All rights reserved.
//

import UIKit
import SDWebImage

class VideoCollectionViewController: UIViewController {
    
    private var videoCollectionView: VideoCollectionView!
    var presenter: VideoCollectionPresenterProtocol?
    private var videos = [VideoModel]()
    
    override func loadView() {
        self.videoCollectionView = VideoCollectionView()
        view = self.videoCollectionView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationController()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.config()
        setupWorker()
        initInterfaceComponent()
        registerCell()
    }
    
    private func setupWorker() {
        let params = ["uid": "000162.8e7c7038d98a4c57a6be27e4906402be.1511"]
        presenter?.getCollections(params)
    }
    
    private func initInterfaceComponent() {
        self.videoCollectionView.videoCollectionView.delegate = self
        self.videoCollectionView.videoCollectionView.dataSource = self
    }
    
    private func registerCell() {
        self.videoCollectionView.videoCollectionView.register(VideoCollectionCell.self, forCellWithReuseIdentifier: Constants.KEY_VIDEO_COLLECTION_CELL)
    }
    
    func setupNavigationController() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.barStyle = .black
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationItem.title = "Video Collection"
    }
    
    private func config() {
        VideoCollectionWireframe.createMainModule(videoCollectionRef: self)
    }
    
    @objc func shareToSocialMedia(_ sender: UIButton) {
    }
    
    @objc func playButtonOnClick(_ sender: UIButton) {
    }
}

extension VideoCollectionViewController: VideoCollectionViewControllerProtocol {
    func displayVideos(_ videos: [VideoModel]) {
        DispatchQueue.main.async {
            self.videos = videos
            self.videoCollectionView.videoCollectionView.reloadData()
        }
    }
}

extension VideoCollectionViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }

    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.KEY_VIDEO_COLLECTION_CELL, for: indexPath) as! VideoCollectionCell
        
        cell.placeholderImageView.sd_setImage(with: URL(string: videos[indexPath.row]._image ?? ""))
        cell.shareButton.addTarget(self, action: #selector(shareToSocialMedia), for: .touchUpInside)
        cell.playButton.addTarget(self, action: #selector(playButtonOnClick), for: .touchUpInside)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.videoCollectionView.videoCollectionView.frame.width - 20
        
        return CGSize(width: width, height: 374)
    }
}

