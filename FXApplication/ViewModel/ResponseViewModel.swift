//
//  ResponseViewModel.swift
//  FXApplication
//
//  Created by Aslıhan Gürkan on 2.02.2023.
//

import Foundation

struct ResponseListViewModel {
    let responseList : [Response]
}

extension ResponseListViewModel {
    func numberOfRowsInSection() -> Int {
        return self.responseList.count
    }
    func responseAtIndex(_ index : Int) -> ResponseViewModel {
        let resp = self.responseList[index]
        return ResponseViewModel(response: resp)
    }
}

struct ResponseViewModel {
    let response : Response
}

extension ResponseViewModel {
    var symbol : String {
        return self.response.s
    }
    var open : String {
        return self.response.o
    }
    var high : String {
        return self.response.h
    }
    var low : String {
        return self.response.l
    }
    var currentPrice : String {
        return self.response.c
    }
//    var ask : String {
//        return self.response.a
//    }
//    var bid : String {
//        return self.response.b
//    }
//    var spread : String {
//        return self.response.sp
//    }
    var changePercentage : String {
        return self.response.cp
    }
    var updatedTime : String {
        return self.response.tm
    }
}
