//
//  ApiModelFile.swift
//  NewsInfo
//
//  Created by Praveen on 16/05/24.
//

import Foundation
struct ApiModel : Codable {

    
    let success : Bool?
    let total_photos : Int?
    let message : String?
    let offset : Int?
    let limit : Int?
    let photos : [Photos]?
    
}
struct Photos : Codable {
  
    
    let url : String?
    let user : Int?
    let title : String?
    let id : Int?
    let description : String?
    let isLike: Bool?
}
