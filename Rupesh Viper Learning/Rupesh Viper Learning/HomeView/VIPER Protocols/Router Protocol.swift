//
//  Router Protocol.swift
//  Rupesh Viper Learning
//
//  Created by Rupeshkumar on 29/05/22.
//

import UIKit

///typealias of  UIVIewController confirming to HomePresenterToViewProtocol
typealias HomeEntryPoint = HomePresenterToViewProtocol & UIViewController
///Protocol for router
protocol HomePresenterToRouterProtocol: AnyObject{
    ///EntryPoint for the app
    var entry: HomeEntryPoint? { get set }
    /// method used to get router
    /// - Returns: router returned after staring
    static func start() -> HomePresenterToRouterProtocol
}
