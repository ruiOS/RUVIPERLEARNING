//
//  Presenter Protocol.swift
//  Rupesh Viper Learning
//
//  Created by Rupeshkumar on 29/05/22.
//

import Foundation

///Presenter Protocol that handles all the protocols belonging to VIPER
typealias PresenterProtocol = HomeViewToPresenterProtocol & HomeInteractorToPresenterProtocol

///Protocol used to refer Presenter from View
protocol HomeViewToPresenterProtocol: AnyObject{

    ///Reference for router of HomeView
    var router: HomePresenterToRouterProtocol? {get set}
    ///Reference for HomeViewProtocol
    ///  - Note: Always set view to weak to avoid retain cycle. Since view already have reference of presenter, this pattern should be followed
    var view: HomePresenterToViewProtocol? {get set}
    ///Reference for interacor of HomeView
    var interacor: HomePresenterToInteractorProtocol? {get set}
    
    /// Called when fetch Button is tapped
    func fetchDataButtonPressed()
}


///Protocol used to refer Presenter from Interactor
protocol HomeInteractorToPresenterProtocol: AnyObject{
    
    /// Called after interactor dfinished fetching Data
    /// - Parameter data: Data fetched by interactor
    func interactorDidFetch(data: HomeViewDataProtocol)
}
