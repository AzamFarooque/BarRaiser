//
//  BarRaiserSongModel.swift
//  BarRaiser
//
//  Created by Farooque Azam on 14/10/23.
//

import Foundation

struct BarRaiserSongModel : Decodable {
    
    var songList : [BarRaiserSongInfo]?
}

struct BarRaiserSongInfo : Decodable {
    
    var name : String?
    var singerName : String?
    var imageName : String?
    var songUrl : String?
    var type : String?
}
