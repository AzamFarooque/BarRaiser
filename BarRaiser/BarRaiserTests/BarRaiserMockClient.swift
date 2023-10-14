//
//  BarRaiserMockClient.swift
//  BarRaiserTests
//
//  Created by Farooque Azam on 14/10/23.
//

import Foundation

@testable import BarRaiser

class BarRaiserMockClient {
    
    
}


extension BarRaiserMockClient : BarRaiserAPIHandlerProtocol{
    
    func getData<T : Decodable>(url: URL, resultType: T.Type, onCompletion: @escaping BarRaiser.serviceResponse) {
        
    }
    
    func getDummyData<T : Decodable>(resultType: T.Type, onCompletion: @escaping BarRaiser.serviceResponse){
        let decoder = JSONDecoder()
        do {
            guard let url = Bundle.main.url(forResource: "Song", withExtension: "json") , let data = try? Data(contentsOf: url) else {return}
            let result = try decoder.decode(T.self, from: data)
            onCompletion(result , nil)
            
        }catch let error {
            debugPrint(error.localizedDescription)
        }
    }
}
