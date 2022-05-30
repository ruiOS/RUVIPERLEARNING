//
//  Presenter.swift
//  Rupesh Viper Learning
//
//  Created by Rupeshkumar on 29/05/22.
//

import Foundation

///Presenter for HomeView
final class HomePresenter: PresenterProtocol{

    var router: HomePresenterToRouterProtocol?

    var interacor: HomePresenterToInteractorProtocol?

    weak var view: HomePresenterToViewProtocol?

    func interactorDidFetch(data: HomeViewDataProtocol) {
        view?.dismissActivity()
        view?.showAlert(withText: data.alertTitle)
    }

    func fetchDataButtonPressed(){
        view?.showActivity()
        interacor?.fetchAlertString()
    }

    func viewDidLoad() {
        view?.setUIElements()
    }
}
