//
//  Login.swift
//  ChatApp01
//
//  Created by Luis Angel Torres G on 10/01/23.
//

import Foundation
import UIKit
import AuthenticationServices

class LoginViewController: UIViewController, ASAuthorizationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        view.backgroundColor = .purple
    }
    
    
    
    private lazy var iconLogin : UIImageView = {
       var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        return imageView
    }()
    
    private let emailField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email field"
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()

    private let passwordField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password field"
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 3
        button.setTitle("Login with email", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(loginFirebase), for: .touchUpInside)

        return button
    }()

    private var stackContainer = UIStackView()

    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }

}

extension LoginViewController {
    private func setupView() {
        
        stackContainer = UIStackView(arrangedSubviews: [ iconLogin, emailField, passwordField, loginButton])
        stackContainer.axis = .vertical
        stackContainer.distribution = .fill
        stackContainer.spacing = 10
        stackContainer.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackContainer)
        
        //Set constraints
        NSLayoutConstraint.activate([
            stackContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            stackContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            // stackContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        ])
        
        //Set image
        guard let url = URL(string: "https://www.onwebchat.com/img/onwebchat_live_chat_system.jpg") else { return }
        URLSession.shared.dataTask(with: url){ [weak self] data, _, _ in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self?.iconLogin.image = UIImage(data: data)
                self?.iconLogin.backgroundColor = .white
            }
        }.resume()
        
    }
    
    @objc private func loginFirebase(sender : UIButton){
        print("Loggin with firebase!")
    }
    
    @objc private func loginAppleID(){
        print("loggin with apple!")
    }
}
