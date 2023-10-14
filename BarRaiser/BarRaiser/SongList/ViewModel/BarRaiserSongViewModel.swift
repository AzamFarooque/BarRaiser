//
//  BarRaiserSongViewModel.swift
//  BarRaiser
//
//  Created by Farooque Azam on 14/10/23.
//

import Foundation


typealias completion = (Bool ,String?) -> Void


class BarRaiserSongViewModel {
    
    var songDetail : BarRaiserSongModel?
    
    func getSongData(resultType : BarRaiserSongModel.Type , onCompletion : @escaping completion){
        BarRaiserAPIManager.shared.getDummyData(resultType: resultType) { [weak self] (data , error) in
            if error == nil {
                if let songData = data as? BarRaiserSongModel{
                    self?.songDetail = songData
                    onCompletion(true , nil)
                }
            }else{
                onCompletion(false , error)
            }
        }
    }
}
