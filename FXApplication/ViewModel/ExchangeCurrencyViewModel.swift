//
//  ExchangeCurrencyViewModel.swift
//  FXApplication
//
//  Created by Aslıhan Gürkan on 1.02.2023.
//

import Foundation

struct ExchangeCurrencyViewModel {
    
    let exchangeCurrency : ExchangeCurrency
   
}

extension ExchangeCurrencyViewModel {
    var status : Bool {
        return self.exchangeCurrency.status
    }
    var code : Int {
        return self.exchangeCurrency.code
    }
    var message : String {
        return self.exchangeCurrency.msg
    }
    var response : [Response] {
        return self.exchangeCurrency.response
    }
}



/*
struct ResponseListViewModel {
    let responseList : [Response]
}

extension ResponseListViewModel {
    func numberOfRowsInSection() -> Int {
        return self.responseList.count
    }
    func exchangeCurrencyAtIndex(_ index: Int) -> ResponseViewModel {
        let response = self.responseList[index]
        return ResponseViewModel(response: response)
    }
}


extension ExchangeCurrencyViewModel {
    func numberOfRowsInSection() -> Int {
        return self.response.count
    }
    
    func exchangeCurrenctAtIndex(_ index: Int) -> ResponseViewModel {
        let response = self.response[index]
        return ResponseViewModel(response: response)
    }
}*/

