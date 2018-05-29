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
    
    @IBOutlet weak var filterButton: UIButton!
    
    @IBOutlet weak var albumsTableView: UITableView!
    
    var albumsList : [AlbumModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAlbumsViewModel.geAlbumList()
        
          self.addObserver(self, forKeyPath: #keyPath(getAlbumsViewModel.albumList), options:  [.old, .new], context: nil)
        albumsTableView.delegate = self
        albumsTableView.dataSource = self
        filterButton.roundCorners([.allCorners], radius: 10)
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(getAlbumsViewModel.albumList) {
           self.albumsList = getAlbumsViewModel.albumList!

            self.albumsTableView.reloadData()
            
        }
    }

}
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let list = albumsList {
            return list.count
        }
        else {
        return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "albumCell") as! AlbumCell
        
        if let title = albumsList?[indexPath.row].title{
        cell.albumTitle.text = title
    }
        
        if let albumID = albumsList?[indexPath.row].albumId{
            cell.albumID.text = "Album: \(albumID)"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
}

