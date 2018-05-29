//
//  FilterResultsViewController.swift
//  Photo App
//
//  Created by Mohamed Hamed on 5/29/18.
//  Copyright © 2018 Mohamed Hamed. All rights reserved.
//

import Foundation
import UIKit

class FilterResultsViewController : UIViewController {
    // MARK: IBOutlets
    @IBOutlet weak var filteredTableView: UITableView!
    // MARK: vars
    var filteredAlbums : [AlbumModel]?
    
    override func viewDidLoad() {
    filteredTableView.delegate = self
        filteredTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
    self.navigationItem.title = "Filtered"
        // decided to show the back button for better UX
//     self.navigationItem.hidesBackButton = true
    }
}

extension FilterResultsViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let list = filteredAlbums {
            return list.count
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "albumCell", for: indexPath) as! AlbumCell
        
        if let title = filteredAlbums?[indexPath.row].title{
            cell.albumTitle.text = title
        }
        
        if let albumID = filteredAlbums?[indexPath.row].albumId{
            cell.albumID.text = "Album: \(albumID)"
        }
        
 
        
        DispatchQueue.global(qos: .background).async {
            do {
                let url = URL(string: ((self.filteredAlbums?[indexPath.row].thumbnailUrl)!))
                let data = try Data(contentsOf: url!)
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    cell.albumPhoto.image = image
                }
                
            }
            catch{
                print(error)
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}
