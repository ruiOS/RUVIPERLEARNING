//
//  View.swift
//  Rupesh Viper Learning
//
//  Created by Rupeshkumar on 29/05/22.
//

import UIKit

///Home View Controller of the app
class HomeViewController: UIViewController, HomeViewProtocol {

    var presenter: HomePresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK: - ViewProtocol
    func showAlert(withText text: String) {
    }
}
