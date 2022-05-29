//
//  Router.swift
//  Rupesh Viper Learning
//
//  Created by Rupeshkumar on 29/05/22.
//

import Foundation

class HomeRouter: HomeRouterProtocol{

    var entry: HomeEntryPoint?

    static func start() -> HomeRouterProtocol {

        let router = HomeRouter()

        let view: HomeViewProtocol = HomeViewController()
        let presenter: HomePresenterProtocol = HomePresenter()
        let interacor: HomeInteractorProtocol = HomeInteractor()

        router.entry = view as? HomeEntryPoint

        //VIP
        view.presenter = presenter

        interacor.presenter = presenter

        presenter.router = router
        presenter.interacor = interacor
        presenter.view = view

        return router
    }

}
