//
//  BarRaiserAPIManager.swift
//  BarRaiser
//
//  Created by Farooque Azam on 14/10/23.
//

import Foundation

typealias serviceResponse = (_ T : Decodable? , _ error : String?) -> Void

protocol BarRaiserAPIHandlerProtocol {
    
    func getData<T : Decodable>(url : URL , resultType : T.Type , onCompletion : @escaping serviceResponse)
    func getDummyData<T : Decodable>(resultType : T.Type , onCompletion : @escaping serviceResponse)
}

class BarRaiserAPIManager {
    
    static let shared = BarRaiserAPIManager()
    
    init(){}
    
}

extension BarRaiserAPIManager : BarRaiserAPIHandlerProtocol{
    
    // MARK: - Get Dummy Data From Local
    
    func getDummyData<T>(resultType: T.Type, onCompletion: @escaping serviceResponse) where T : Decodable {
        let decoder = JSONDecoder()
        do {
            guard let url = Bundle.main.url(forResource: "Song", withExtension: "json") , let data = try? Data(contentsOf: url) else {return}
            let result = try decoder.decode(T.self, from: data)
            onCompletion(result , nil)
            
        }catch let error {
            debugPrint(error.localizedDescription)
        }
    }
    
    
    
    func getData<T>(url: URL, resultType: T.Type, onCompletion: @escaping serviceResponse) where T : Decodable {
        
    }

}
