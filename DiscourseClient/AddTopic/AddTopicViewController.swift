//
//  AddTopicViewController.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 08/02/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

/// ViewController representando un formulario de entrada para crear un topic
class AddTopicViewController: UIViewController {
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .line
        textField.placeholder = NSLocalizedString("Insert topic title and tap Submit", comment: "")

        return textField
    }()
    
    lazy var textField2: UITextField = {
        let textField2 = UITextField()
        textField2.translatesAutoresizingMaskIntoConstraints = false
        textField2.borderStyle = .line
        textField2.placeholder = NSLocalizedString("Insert comment for the topic", comment: "")

        return textField2
    }()

    let viewModel: AddTopicViewModel

    init(viewModel: AddTopicViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func loadView() {
        view = UIView()
        view.backgroundColor = .white

        view.addSubview(textField)
        NSLayoutConstraint.activate([
            textField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            textField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
        ])
        
        view.addSubview(textField2)
        
        NSLayoutConstraint.activate([
            textField2.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            textField2.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            textField2.topAnchor.constraint(equalTo: textField.safeAreaLayoutGuide.topAnchor, constant: 32)
        ])

        let submitButton = UIButton(type: .system)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.setTitle(NSLocalizedString("Submit", comment: ""), for: .normal)
        submitButton.backgroundColor = .cyan
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)

        view.addSubview(submitButton)
        NSLayoutConstraint.activate([
            submitButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            submitButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            submitButton.topAnchor.constraint(equalTo: textField2.bottomAnchor, constant: 8)
        ])

        let rightBarButtonItem: UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "multiply"), style: .plain, target: self, action: #selector(cancelButtonTapped))
        rightBarButtonItem.tintColor = .black
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }

    @objc fileprivate func cancelButtonTapped() {
        viewModel.cancelButtonTapped()
    }

    @objc fileprivate func submitButtonTapped() {
        guard let text = textField.text, !text.isEmpty else { return }
        guard let raw = textField2.text, !raw.isEmpty else { return }
        viewModel.submitButtonTapped(title: text, raw: raw)
    }

    fileprivate func showErrorAddingTopicAlert(error: Error) {
        if case let SessionAPIError.apiError(finalAPIError) = error {
            let action = finalAPIError.action ?? "No action"
            let errors = finalAPIError.errors?.joined(separator: ", ") ?? "No error"
            let message = NSLocalizedString("\(action) error: \(errors)" , comment:"")
            showAlert(message)
        }
    }
}

extension AddTopicViewController: AddTopicViewDelegate {
    func errorAddingTopic(error: Error) {
        showErrorAddingTopicAlert(error: error)
    }
}
