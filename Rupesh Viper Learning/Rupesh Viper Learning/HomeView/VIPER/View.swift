//
//  View.swift
//  Rupesh Viper Learning
//
//  Created by Rupeshkumar on 29/05/22.
//

import UIKit

///Home View Controller of the app
final class HomeViewController: UIViewController, HomePresenterToViewProtocol {

    private let fetchButton: HighlitingButton = {
        let tempButton = HighlitingButton()
        tempButton.translatesAutoresizingMaskIntoConstraints = false
        tempButton.setTitle("Fetch", for: [])
        tempButton.backgroundColor = .white
        tempButton.setTitleColor(.black, for: [])
        return tempButton
    }()

    var presenter: PresenterProtocol?

    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .orange
        setFetchButton()
    }

    //MARK: - Set Views

    private func setFetchButton(){
        fetchButton.addTarget(self, action: #selector(fetchDataButtonPressed), for: .touchUpInside)

        self.view.addSubview(fetchButton)

        let height: CGFloat = max(self.view.frame.height, self.view.frame.width) * 0.05
        let width: CGFloat = min(self.view.frame.height, self.view.frame.width) * 0.4
        fetchButton.layer.cornerRadius = 7
        fetchButton.layer.borderColor = UIColor.gray.cgColor
        fetchButton.layer.borderWidth = 1

        NSLayoutConstraint.activate([
            fetchButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            fetchButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            fetchButton.widthAnchor.constraint(equalToConstant: width),
            fetchButton.heightAnchor.constraint(equalToConstant:height)
        ])
    }

    @objc private func fetchDataButtonPressed(){
        presenter?.fetchDataButtonPressed()
    }

    //MARK: - ViewProtocol
    func showAlert(withText text: String?) {
        DispatchQueue.main.async { [weak self] in
            let alert = UIAlertController(title: nil, message: text, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self?.present(alert, animated: true)
        }
    }

    func showActivity() {
        
    }

    func dismissActivity() {
        
    }

}

final class HighlitingButton: UIButton{
    override var isHighlighted: Bool{
        didSet{
            alpha = isHighlighted ? 0.8: 1
        }
    }
}
