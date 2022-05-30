//
//  Interactor Protocol.swift
//  Rupesh Viper Learning
//
//  Created by Rupeshkumar on 29/05/22.
//

import Foundation

///Protocol used to reference  interactor from Presenter
protocol HomePresenterToInteractorProtocol: AnyObject{
    ///Reference for Presenter of HomeView
    ///  - Note: Always set presenter to weak to avoid retain cycle. Since Presenter already have reference of interactor, this pattern should be followed
    var presenter: HomeInteractorToPresenterProtocol? {get set}

    ///method is used to fetch alert string
    func fetchAlertString()
}

/// Protocol used to add title fetcher Dependency Injection
protocol InteractorDependecyInjectionProtocol: AnyObject{
    ///fetcher used to handle data fetches
    var alertTitleFetcher: AlertStringFetcherProtocol {get set}
}
