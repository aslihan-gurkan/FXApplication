//
//  ExchangeRatesService.swift
//  FXApplication
//
//  Created by Aslıhan Gürkan on 1.02.2023.
//

import Foundation

class ExchangeRatesService {
    
    func getExchangeCurrencies (url: URL, completion: @escaping (ExchangeCurrency?) -> ())  {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
                let exchangeCurrency = try? JSONDecoder().decode(ExchangeCurrency.self, from: data)
                //print(exchangeCurrency)
                if let exchangeCurrency = exchangeCurrency {
                    completion(exchangeCurrency)
                }
            }
        }.resume()
        
    }
}
