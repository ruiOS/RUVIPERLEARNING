//
//  View Protocols.swift
//  Rupesh Viper Learning
//
//  Created by Rupeshkumar on 30/05/22.
//

import Foundation

///Protocol to reference view from Presenter
protocol HomePresenterToViewProtocol: AnyObject{

    ///Reference for Presenter of HomeView
    var presenter: PresenterProtocol? { get set }

    /// method to showAlert in HomeView
    /// - Parameter text: text to be shown in alert
    func showAlert(withText text: String?)

    ///method used to show activity View
    func showActivity()

    ///method used to dismiss activity View
    func dismissActivity()

}
