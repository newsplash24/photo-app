//
//  ViewController.swift
//  Photo App
//
//  Created by Mohamed Hamed on 5/29/18.
//  Copyright © 2018 Mohamed Hamed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
@objc let getAlbumsViewModel = GetAlbumsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAlbumsViewModel.geAlbumList()
        
          self.addObserver(self, forKeyPath: #keyPath(getAlbumsViewModel.albumList), options:  [.old, .new], context: nil)
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(getAlbumsViewModel.albumList) {
           
             print(getAlbumsViewModel.albumList!)
        }
    }


}

