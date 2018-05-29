//
//  ViewController.swift
//  Photo App
//
//  Created by Mohamed Hamed on 5/29/18.
//  Copyright © 2018 Mohamed Hamed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: IBOutlets
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var albumsTableView: UITableView!
    // MARK: vars
    @objc let getAlbumsViewModel = GetAlbumsViewModel()
    var albumsList : [AlbumModel]?
    var selectedAlbumCells = [AlbumModel]()
    // MARK: IBActions
    @IBAction func filterBtnTapped(_ sender: Any) {
        if selectedAlbumCells.count <= 0 {
            Utility.showAlert(controller: self, title: "", message: "Please select something!", buttonTitle: "OK")
        }
        else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "FilterResultsViewController") as! FilterResultsViewController
            controller.filteredAlbums = selectedAlbumCells
            
            // Changing navigation back button title before pushing the ViewController
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
            
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAlbumsViewModel.geAlbumList()
        
        self.addObserver(self, forKeyPath: #keyPath(getAlbumsViewModel.albumList), options:  [.old, .new], context: nil)
        albumsTableView.delegate = self
        albumsTableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationItem.title = "Check To Filter This List"
    }
    
    override func viewWillLayoutSubviews() {
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
    // MARK: listeners
    func radioButtonTapped(sender: RadioButton!) {
        let tag = sender.tag
        if sender.isSelected {
            albumsList![tag].isSelected = true
            if !(selectedAlbumCells.contains(albumsList![tag])) {
                selectedAlbumCells.append(albumsList![tag])
            }
            
        }
        else {
            albumsList![tag].isSelected = false
            if selectedAlbumCells.contains(albumsList![tag]) {
                let indx = selectedAlbumCells.index(of: albumsList![tag])
                selectedAlbumCells.remove(at: indx!)
            }
            
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "albumCell", for: indexPath) as! AlbumCell
        
        if let title = albumsList?[indexPath.row].title{
            cell.albumTitle.text = title
        }
        
        if let albumID = albumsList?[indexPath.row].albumId{
            cell.albumID.text = "Album: \(albumID)"
        }
        
        cell.radioButton.tag = indexPath.row
        cell.radioButton.addTarget(self, action: #selector(self.radioButtonTapped(sender:)), for: .touchUpInside)
        
        if (albumsList?[indexPath.row].isSelected)! {
            cell.radioButton.isSelected = true
        }
        else {
            cell.radioButton.isSelected = false
        }
        
        DispatchQueue.global(qos: .background).async {
            do {
                let url = URL(string: ((self.albumsList?[indexPath.row].thumbnailUrl)!))
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

