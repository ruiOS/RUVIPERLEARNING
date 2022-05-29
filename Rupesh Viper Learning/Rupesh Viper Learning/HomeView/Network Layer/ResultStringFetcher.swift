//
//  ResultStringFetcher.swift
//  Rupesh Viper Learning
//
//  Created by Rupeshkumar on 29/05/22.
//

import Foundation

/// Protocol to fetch alert string
protocol AlertStringFetcherProtocol{
    /// method used to fetch alert string
    /// - Parameter completionBlock: executes after string is fetched
    func fetchAlertString(completionBlock: @escaping ((String) -> Void))
}

/// Handles fetch alert string actions
struct AlertStringFetcher: AlertStringFetcherProtocol{

    func fetchAlertString(completionBlock: @escaping ((String) -> Void)){
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 2) {
            completionBlock("Data has been fetched successfully..!")
        }
    }

}
