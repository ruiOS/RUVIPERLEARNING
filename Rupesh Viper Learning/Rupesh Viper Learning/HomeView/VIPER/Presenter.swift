//
//  Presenter.swift
//  Rupesh Viper Learning
//
//  Created by Rupeshkumar on 29/05/22.
//

import Foundation

///Presenter for HomeView
final class HomePresenter: HomePresenterProtocol{

    var router: HomeRouterProtocol?

    var interacor: HomeInteractorProtocol?

    var view: HomeViewProtocol?

    func interactorDidFetchData(_ data: Result<HomeViewDataProtocol, Error>) {
    }

}
