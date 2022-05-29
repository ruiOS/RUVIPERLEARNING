//
//  Router.swift
//  Rupesh Viper Learning
//
//  Created by Rupeshkumar on 29/05/22.
//

import Foundation

class HomeRouter: HomePresenterToRouterProtocol{

    var entry: HomeEntryPoint?

    static func start() -> HomePresenterToRouterProtocol {

        let router = HomeRouter()

        let view: HomePresenterToViewProtocol = HomeViewController()
        let presenter: PresenterProtocol = HomePresenter()
        let interacor: HomePresenterToInteractorProtocol = HomeInteractor(stringFetcher: ResultStringFetcher())

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
