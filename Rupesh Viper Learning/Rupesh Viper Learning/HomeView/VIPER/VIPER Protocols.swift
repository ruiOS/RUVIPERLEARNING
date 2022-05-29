//
//  VIPER Protocols.swift
//  Rupesh Viper Learning
//
//  Created by Rupeshkumar on 29/05/22.
//

import UIKit

//MARK: - View

///Protocol for HomeView
protocol HomePresenterToViewProtocol: AnyObject{
    ///Reference for Presenter of HomeView
    var presenter: PresenterProtocol? { get set }

    /// method to showAlert in HomeView
    /// - Parameter text: text to be shown in alert
    func showAlert(withText text: String?)

    func showActivity()

    func dismissActivity()

}

//MARK: - Interactor

protocol InteractorDependecyInjectionProtocol: AnyObject{
    var alertTitleFetcher: AlertStringFetcherProtocol {get set}
}

///Protocol for Interactor
protocol HomePresenterToInteractorProtocol: AnyObject{
    ///Reference for Presenter of HomeView
    var presenter: HomeInteractorToPresenterProtocol? {get set}

    ///method is used to fetch alert string
    func fetchAlertString()
}

//MARK: - Presenter

///Protocol for Presenter
protocol HomeViewToPresenterProtocol: AnyObject{

    ///Reference for router of HomeView
    var router: HomePresenterToRouterProtocol? {get set}
    ///Reference for HomeViewProtocol
    var view: HomePresenterToViewProtocol? {get set}
    ///Reference for interacor of HomeView
    var interacor: HomePresenterToInteractorProtocol? {get set}

    func fetchDataButtonPressed()

}

protocol HomeInteractorToPresenterProtocol: AnyObject{

    func interactorDidFetch(data: HomeViewDataProtocol)

}

typealias PresenterProtocol = HomeViewToPresenterProtocol & HomeInteractorToPresenterProtocol

//MARK: - Entity

///Protocol for Entity/HomeViewData
protocol HomeViewDataProtocol{
    ///alert string to be shown
    var alertTitle: String? { get set }
}

//MARK: - Router

typealias HomeEntryPoint = HomePresenterToViewProtocol & UIViewController
///Protocol for router
protocol HomePresenterToRouterProtocol: AnyObject{
    ///EntryPoint for the app
    var entry: HomeEntryPoint? { get set }
    ///method used to get router
    static func start() -> HomePresenterToRouterProtocol
}
