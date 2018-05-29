//
//  GetAlbumsViewModel.swift
//  Photo App
//
//  Created by Mohamed Hamed on 5/29/18.
//  Copyright © 2018 Mohamed Hamed. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class GetAlbumsViewModel : NSObject {
    
    @objc dynamic var albumList: [AlbumModel]?
    
    override init() {
        
    }
    
    
    func geAlbumList() {
        
        LoadingView.instance.showLoading()
        
        let url = URL(string: Constants.API.baseURL + Constants.API.photos)!
        
        
        Alamofire.request(url, method: .get).validate().responseArray(completionHandler: { (response: DataResponse<[AlbumModel]>) in
            
            guard response.result.isSuccess else {
                print("Error while fetching albumbs: \(response.result.error)")
                
                self.onFailure()
                
                return
            }
            
            guard let result = response.result.value else {
                
                print("Error in casting result!")
                
                self.onFailure()
                
                return
            }
            
            self.albumList = result
            
            self.onSuccess()
        })
    }
    
    func onSuccess() {
        
        LoadingView.instance.dismissLoading()
    }
    
    func onFailure() {
        
        print("Failed to call albumbs web service")
        
        LoadingView.instance.dismissLoading()
    }
}
