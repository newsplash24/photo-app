//
//  AlbumModel.swift
//  Photo App
//
//  Created by Mohamed Hamed on 5/29/18.
//  Copyright © 2018 Mohamed Hamed. All rights reserved.
//

import Foundation
import ObjectMapper

class AlbumModel : Mappable {
    
    var id : Int?
    var albumId : Int?
    var title : String?
    var url : String?
    var thumbnailUrl : String?
    var isSelected : Bool?
   
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        albumId <- map["albumId"]
        title <- map["title"]
        url <- map["url"]
        thumbnailUrl <- map["thumbnailUrl"]
        
    }
    
    
}
