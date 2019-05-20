//
//  ViewController.swift
//  Assignment7
//
//  Created by Thong Hoang Nguyen on 2019-05-07.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, URLSessionDownloadDelegate, URLSessionTaskDelegate {
    let url1 = URL(string: "http://imgur.com/bktnImE.png")
    let url2 = URL(string: "http://imgur.com/zdwdenZ.png")
    let url3 = URL(string: "http://imgur.com/CoQ8aNl.png")
    let url4 = URL(string: "http://imgur.com/2vQtZBb.png")
    let url5 = URL(string: "http://imgur.com/y9MIaCS.png")
    lazy var urlArray = [url1, url2, url3, url4, url5]
    var ran = 0
    let phoneImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    lazy var randomButton: UIButton = {
        let butt = UIButton(type: .roundedRect)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.backgroundColor = .white
        butt.setTitle("Random", for: .normal)
        butt.setTitleColor(.black, for: .normal)
        butt.layer.cornerRadius = 10
        butt.layer.borderWidth = 2
        butt.addTarget(self, action: #selector(randomizeImage), for: .touchUpInside)
        return butt
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(phoneImageView)
        view.addSubview(randomButton)
        NSLayoutConstraint.activate([
            randomButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            randomButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            randomButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/6),
            randomButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        phoneImageView.matchParent()
        downloadImage(url: urlArray[0])
    }
    fileprivate func downloadImage(url: URL?) {
        // 1. create a url object
        guard let url = url else { return }
        // 2. create a URLSession object
        let configuration = URLSessionConfiguration.background(withIdentifier: "CICCC")
        let session = URLSession(configuration: configuration, delegate: self, delegateQueue: OperationQueue())
        // 3.  create a task (downloadTask)
        // 4. resume! (by default, task -> suspended state)
        session.downloadTask(with: url).resume()
    }
    @objc func randomizeImage(){
        ran = Int(arc4random_uniform(UInt32(urlArray.count)))
        downloadImage(url: urlArray[ran])
    }
    
    //MARK: - URLSession Delegate
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        // 5. update UI (from main thread)
        let data = try! Data(contentsOf: location)
        OperationQueue.main.addOperation {
            self.phoneImageView.image = UIImage(data: data)
        }
    }
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite) * 100
        print(Int(progress.rounded()),"%")
    }
}

