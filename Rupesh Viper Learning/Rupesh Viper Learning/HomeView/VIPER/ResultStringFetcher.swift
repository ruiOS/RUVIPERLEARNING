//
//  ResultStringFetcher.swift
//  Rupesh Viper Learning
//
//  Created by Rupeshkumar on 29/05/22.
//

import Foundation

protocol AlertStringFetcherProtocol{
    func fetchAlertString(completionBlock: @escaping ((String) -> Void))
}

struct AlertStringFetcher: AlertStringFetcherProtocol{

    func fetchAlertString(completionBlock: @escaping ((String) -> Void)){
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 2) {
            completionBlock("Data has been fetched successfully..!")
        }
    }

}
