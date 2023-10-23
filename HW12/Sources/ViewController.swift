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
    private var timer: Timer = Timer()
    private var timerProgress: CGFloat = 0
    private var timerDuration = 0.0
    private var count: Int = 25

    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .systemRed
        label.text = "25 : 00"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        }()

    private lazy var playButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "play", withConfiguration: UIImage.SymbolConfiguration(pointSize: 50, weight: .medium, scale: .default)), for: .normal)
        button.tintColor = .systemRed
        button.addTarget(self, action: #selector(playPausePressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        }()

    private lazy var progressBar: ProgressView = {
        let view = ProgressView()
//        view.drawPrograss(with: 0.7)
        view.translatesAutoresizingMaskIntoConstraints = false
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
        configurWork(with: Double(count), progress: Double(count))
        }

    private func setupLayout () {
            NSLayoutConstraint.activate([
                timeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                timeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),

                playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                playButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 70),
                playButton.heightAnchor.constraint(equalToConstant: 150),
                playButton.widthAnchor.constraint(equalToConstant: 150),

                progressBar.topAnchor.constraint(equalTo: timeLabel.topAnchor, constant: -70),
                progressBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
                progressBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
            ])
        }


    // MARK: - Actions

    @objc private func playPausePressed() {
        if isStarted {
            timer.invalidate()
            changeImageButtonToPlay()
            isStarted = false
        } else {
            changeImageButtonToPause()
            isStarted = true
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        }
    }

    @objc private func timerCounter() -> Void {

        if count > 0 && isWorkTime {
            count = count - 1
            configurWork(with: 25.0, progress: Double(count))
            let timeString = makeTimeString(seconds: count)
            timeLabel.text = timeString
            timeLabel.textColor = .systemRed
            playButton.tintColor = .systemRed
        } else if count > 0 && !isWorkTime {
            count = count - 1
            configurRelax(with: 5.0, progress: Double(count))
            let timeString = makeTimeString(seconds: count)
            timeLabel.text = timeString
            timeLabel.textColor = .systemMint
            playButton.tintColor = .systemMint
        } else if isWorkTime {
            count = 5
            configurRelax(with: Double(count), progress: Double(count))
            timeLabel.text = "5 : 00"
            timeLabel.textColor = .systemMint
            playButton.tintColor = .systemMint
            isWorkTime = false
        } else {
            count = 25
            configurWork(with: Double(count), progress: Double(count))
            timeLabel.text = "25 : 00"
            timeLabel.textColor = .systemRed
            playButton.tintColor = .systemRed
            isWorkTime = true
        }
    }

    private func makeTimeString(seconds: Int) -> String {
        var timeString = ""
        timeString += String(format: "%2d", seconds)
        timeString += " : 00"
        return timeString
    }

    private func changeImageButtonToPlay() {
        playButton.setImage(UIImage(systemName: "play", withConfiguration: UIImage.SymbolConfiguration(pointSize: 50, weight: .medium, scale: .default)), for: .normal)
    }

    private func changeImageButtonToPause() {
        playButton.setImage(UIImage(systemName: "pause", withConfiguration: UIImage.SymbolConfiguration(pointSize: 50, weight: .medium, scale: .default)), for: .normal)
    }

    private func configurWork(with duration: Double, progress: Double) {
        timerDuration = duration

        let tempCurrentValue = progress > duration ? duration : progress
        let goalValueDevider = duration == 0 ? 1 : duration
        let percent = tempCurrentValue / goalValueDevider
        progressBar.drawPrograssWork(with: CGFloat(percent))
    }

    private func configurRelax(with duration: Double, progress: Double) {
        timerDuration = duration

        let tempCurrentValue = progress > duration ? duration : progress
        let goalValueDevider = duration == 0 ? 1 : duration
        let percent = tempCurrentValue / goalValueDevider
        progressBar.drawPrograssRelax(with: CGFloat(percent))
    }
}

