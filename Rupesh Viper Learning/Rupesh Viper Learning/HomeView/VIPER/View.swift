//
//  View.swift
//  Rupesh Viper Learning
//
//  Created by Rupeshkumar on 29/05/22.
//

import UIKit

///Home View Controller of the app
final class HomeViewController: UIViewController, HomePresenterToViewProtocol {

    //MARK: - Delegates
    var presenter: PresenterProtocol?

    //MARK: - Views
    ///activity view used to handle activity in the view controller
    private var activityView: UIActivityIndicatorView?

    ///fetch button to fetch data
    private let fetchButton: HighLightEnabledButton = {
        let tempButton = HighLightEnabledButton()
        tempButton.translatesAutoresizingMaskIntoConstraints = false
        tempButton.setTitle("Fetch", for: [])
        tempButton.backgroundColor = .white
        tempButton.setTitleColor(.black, for: [])
        return tempButton
    }()

    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .orange
        setFetchButton()
    }

    //MARK: - Fetch Button
    
    /// method sets fetch button and its properties
    private func setFetchButton(){
        //set target
        fetchButton.addTarget(self, action: #selector(fetchDataButtonPressed), for: .touchUpInside)

        // add to view
        self.view.addSubview(fetchButton)

        let height: CGFloat = max(self.view.frame.height, self.view.frame.width) * 0.05
        let width: CGFloat = min(self.view.frame.height, self.view.frame.width) * 0.4

        NSLayoutConstraint.activate([
            fetchButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            fetchButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            fetchButton.widthAnchor.constraint(equalToConstant: width),
            fetchButton.heightAnchor.constraint(equalToConstant:height)
        ])

        //set corner radius
        fetchButton.layer.cornerRadius = 7
        fetchButton.layer.borderColor = UIColor.gray.cgColor
        fetchButton.layer.borderWidth = 1
    }

    
    /// Method called when fetch data button is pressed
    @objc private func fetchDataButtonPressed(){
        presenter?.fetchDataButtonPressed()
    }

    //MARK: - HomePresenterToViewProtocol
    func showAlert(withText text: String?) {
        DispatchQueue.main.async { [weak self] in
            let alert = UIAlertController(title: nil, message: text, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self?.present(alert, animated: true)
        }
    }

    func showActivity() {
        DispatchQueue.main.async { [weak self] in
            // check self and intialise activity view
            guard let weakSelf = self else {return}
            weakSelf.activityView = UIActivityIndicatorView(style: .whiteLarge)
            guard let activityView = weakSelf.activityView else {return}

            // remove main view interaction to prevent multiple data fetches
            weakSelf.view.isUserInteractionEnabled = false
            weakSelf.view.alpha = 0.7

            //add activity view to main view
            activityView.translatesAutoresizingMaskIntoConstraints = false

            weakSelf.view.addSubview(activityView)

            NSLayoutConstraint.activate([
                activityView.centerXAnchor.constraint(equalTo: weakSelf.view.centerXAnchor),
                activityView.topAnchor.constraint(equalTo: weakSelf.fetchButton.bottomAnchor, constant: 20)
            ])

            //animate activity view
            activityView.startAnimating()
        }
    }

    func dismissActivity() {
        DispatchQueue.main.async { [weak self] in
            // check self activity view
            guard let weakSelf = self,
                  let activityView = weakSelf.activityView else { return }
            //stop activity view and deinitialise
            activityView.stopAnimating()
            activityView.removeFromSuperview()
            weakSelf.activityView = nil

            // start main view interaction
            weakSelf.view.isUserInteractionEnabled = true
            weakSelf.view.alpha = 1
        }
    }

}
