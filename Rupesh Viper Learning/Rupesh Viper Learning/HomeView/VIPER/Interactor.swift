//
//  Interactor.swift
//  Rupesh Viper Learning
//
//  Created by Rupeshkumar on 29/05/22.
//

import Foundation

///Interactor for HomeView
final class HomeInteractor: HomePresenterToInteractorProtocol, InteractorDependecyInjectionProtocol{

    var stringFetcher: ResultStringFetcherProtocol

    weak var presenter: HomeInteractorToPresenterProtocol?

    init(stringFetcher: ResultStringFetcherProtocol){
        self.stringFetcher = stringFetcher
    }

    func fetchAlertString(){
        stringFetcher.fetchAlertString { [weak self] alertData in
            self?.presenter?.interactorDidFetch(data: HomeViewData(alertTitle: alertData))
        }
    }

}
