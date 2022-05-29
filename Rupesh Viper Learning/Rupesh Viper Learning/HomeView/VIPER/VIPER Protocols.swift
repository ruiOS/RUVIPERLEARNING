//
//  VIPER Protocols.swift
//  Rupesh Viper Learning
//
//  Created by Rupeshkumar on 29/05/22.
//

import Foundation

//MARK: - View

///Protocol for HomeView
protocol HomeViewProtocol: AnyObject{
    ///Reference for Presenter of HomeView
    var presenter: HomePresenterProtocol? { get set }

    ///method to showAlert in HomeView
    func showAlert(withText text: String)
}

//MARK: - Interactor

///Protocol for Interactor
protocol HomeInteractorProtocol{
    ///Reference for Presenter of HomeView
    var presenter: HomePresenterProtocol? {get set}

    ///method is used to fetch alert string
    func fetchAlertString()
}


//MARK: - Presenter

///Protocol for Presenter
protocol HomePresenterProtocol{
    
    ///Reference for router of HomeView
    var router: HomeRouterProtocol? {get set}
    ///Reference for interacor of HomeView
    var interacor: HomeInteractorProtocol? {get set}
    ///Reference for HomeViewProtocol
    var view: HomeViewProtocol? {get set}

    func interactorDidFetchData(_ data: Result<HomeViewDataProtocol, Error>)
}

//MARK: - Entity

///Protocol for Entity/HomeViewData
protocol HomeViewDataProtocol{
    ///alert string to be shown
    var alertTitle: String? { get set }
}

//MARK: - Router

//Entry Point
///Protocol for router
protocol HomeRouterProtocol{
    ///method used to get router
    static func start() -> HomeRouterProtocol
}
