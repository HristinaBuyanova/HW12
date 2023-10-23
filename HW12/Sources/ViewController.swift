//
//  ViewController.swift
//  HW12
//
//  Created by Христина Буянова on 21.10.2023.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets

    private var isWorkTime = true
    private var isStarted = false

    private lazy var timeLabel: UILabel = {
            let label = UILabel()

            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()

    private lazy var playButton: UIButton = {
        let button = UIButton()

        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        }()

    private lazy var progressBar: ProgressView = {
        let view = ProgressView()

        return view
    }()



    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierrarchy()
        setupLayout()

    }

    // MARK: - Setup
    private func setupView() {
        view.backgroundColor = .white
        }

    private func setupHierrarchy () {
        view.addSubview(progressBar)
        view.addSubview(timeLabel)
        view.addSubview(playButton)
        }

    private func setupLayout () {
            NSLayoutConstraint.activate([
                timeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                timeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),

                playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                playButton.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 20),

                progressBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                progressBar.bottomAnchor.constraint(equalTo: timeLabel.topAnchor, constant: -20)
            ])
        }


    // MARK: - Actions


}

