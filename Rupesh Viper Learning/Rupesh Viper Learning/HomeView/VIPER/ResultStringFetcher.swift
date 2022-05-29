//
//  ResultStringFetcher.swift
//  Rupesh Viper Learning
//
//  Created by Rupeshkumar on 30/05/22.
//

import Foundation

protocol ResultStringFetcherProtocol{
    func fetchAlertString(completionBlock: @escaping ((String) -> Void))
}

struct ResultStringFetcher: ResultStringFetcherProtocol{

    func fetchAlertString(completionBlock: @escaping ((String) -> Void)){
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 2) {
            completionBlock("Data Has Been Fetched Successfully")
        }
    }

}
