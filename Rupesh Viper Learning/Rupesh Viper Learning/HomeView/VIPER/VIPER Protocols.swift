//
//  VIPER Protocols.swift
//  Rupesh Viper Learning
//
//  Created by Rupeshkumar on 29/05/22.
//

import UIKit

//MARK: - View

///Protocol for HomeView
protocol HomeViewProtocol: AnyObject{
    ///Reference for Presenter of HomeView
    var presenter: HomePresenterProtocol? { get set }

    /// method to showAlert in HomeView
    /// - Parameter text: text to be shown in alert
    func showAlert(withText text: String)
}

//MARK: - Interactor

///Protocol for Interactor
protocol HomeInteractorProtocol: AnyObject{
    ///Reference for Presenter of HomeView
    var presenter: HomePresenterProtocol? {get set}

    ///method is used to fetch alert string
    func fetchAlertString()
}


//MARK: - Presenter

///Protocol for Presenter
protocol HomePresenterProtocol: AnyObject{
    
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

typealias HomeEntryPoint = HomeViewProtocol & UIViewController
///Protocol for router
protocol HomeRouterProtocol: AnyObject{
    ///EntryPoint for the app
    var entry: HomeEntryPoint? { get set }
    ///method used to get router
    static func start() -> HomeRouterProtocol
}
