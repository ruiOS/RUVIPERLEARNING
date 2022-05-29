//
//  Interactor.swift
//  Rupesh Viper Learning
//
//  Created by Rupeshkumar on 29/05/22.
//

import Foundation

///Interactor for HomeView
final class HomeInteractor: HomePresenterToInteractorProtocol, InteractorDependecyInjectionProtocol{

    var alertTitleFetcher: AlertStringFetcherProtocol

    weak var presenter: HomeInteractorToPresenterProtocol?

    init(alertTitleFetcher: AlertStringFetcherProtocol){
        self.alertTitleFetcher = alertTitleFetcher
    }

    func fetchAlertString(){
        alertTitleFetcher.fetchAlertString { [weak self] alertData in
            self?.presenter?.interactorDidFetch(data: HomeViewData(alertTitle: alertData))
        }
    }

}
