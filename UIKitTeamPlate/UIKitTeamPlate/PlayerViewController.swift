// PlayerViewController.swift
// Copyright © RoadMap. All rights reserved.

import AVFoundation
import UIKit

/// Экран Плеера
final class PlayerViewController: UIViewController {
    // MARK: - @IBOutlets

    @IBOutlet var volumeslider: UISlider!
    @IBOutlet var photoArtistImageView: UIImageView!
    @IBOutlet var nameArtistLabel: UILabel!
    @IBOutlet var nameSongsLabel: UILabel!
    @IBOutlet var playerSlider: UISlider!
    @IBOutlet var remainingTime: UILabel!
    @IBOutlet var playButtonOutlet: UIButton!

    // MARK: - Properties

    /// Плеер
    var playerTrack = AVAudioPlayer()
    /// изображение исполнителя
    var imageArtist = UIImage()
    /// название/имя исполнителя
    var nameArtist = String()
    /// название песни
    var nameSong = String()
    /// номер песни
    var numberSong = 0

    // MARK: - Private Properties

    private var timer = Timer()
    private let songs = ["griby-taet-ljod", "niletto-ljubimka"]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Private Methods

    private func configureUI() {
        photoArtistImageView.image = imageArtist
        nameArtistLabel.text = nameArtist
        nameSongsLabel.text = nameSong

        playerTrack.play()
        playerSlider.maximumValue = Float(playerTrack.duration)

        volumeslider.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi / -2))

        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(upDateTime),
            userInfo: nil,
            repeats: true
        )
    }

    /// создаем обратный отчет для лейбла - remainingTime
    @objc private func upDateTime() {
        let differentTime = playerTrack.duration - playerTrack.currentTime
        let minuteEnd = Int(differentTime / 60)
        let secondEnd = Int(differentTime.truncatingRemainder(dividingBy: 60))
        remainingTime.text = NSString(format: "%02d:%02d", minuteEnd, secondEnd) as String
        playerSlider.setValue(Float(playerTrack.currentTime), animated: true)
    }

    // MARK: - @IBActions

    /// задаем значения для playerSlider
    @IBAction func playerSlider(_ sender: UISlider) {
        if sender == playerSlider {
            playerTrack.currentTime = TimeInterval(sender.value)
        }
    }

    /// задаем значения для слайдера громкости
    @IBAction func volumeSlider(_ sender: UISlider) {
        playerTrack.volume = sender.value
    }

    /// включение предыдущего трека
    @IBAction func backwardButton(_ sender: UIButton) {
        if numberSong == 1 {
            numberSong = 0
            photoArtistImageView.image = UIImage(named: "imageGriby")
            nameArtistLabel.text = "Грибы"
            nameSongsLabel.text = "Тает лед"
        } else {
            numberSong = 1
            photoArtistImageView.image = UIImage(named: "ImageLubimka")
            nameArtistLabel.text = "Niletto"
            nameSongsLabel.text = "Niletto - Любимка"
        }

        do {
            if let audioPath = Bundle.main.path(
                forResource: songs[numberSong],
                ofType: "mp3"
            ) {
                try playerTrack = AVAudioPlayer(
                    contentsOf: URL(fileURLWithPath: audioPath)
                )
            }
        } catch {
            print("Error")
        }
        playerTrack.play()
    }

    /// включаем/ставим на паузу трек
    @IBAction func playButton(_ sender: UIButton) {
        if playerTrack.isPlaying {
            playerTrack.pause()
            sender.setImage(UIImage(named: "playButton"), for: .normal)
            playButtonOutlet.tintColor = .white
        } else {
            playerTrack.play()
            sender.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            playButtonOutlet.tintColor = .white
        }
    }

    /// включение следующего трека
    @IBAction func forwardButton(_ sender: UIButton) {
        if numberSong == 1 {
            numberSong = 0
            photoArtistImageView.image = UIImage(named: "imageGriby")
            nameArtistLabel.text = "Грибы"
            nameSongsLabel.text = "Тает лед"
        } else {
            numberSong = 1
            photoArtistImageView.image = UIImage(named: "ImageLubimka")
            nameArtistLabel.text = "Niletto"
            nameSongsLabel.text = "Niletto - Любимка"
        }

        do {
            if let audioPath = Bundle.main.path(
                forResource: songs[numberSong],
                ofType: "mp3"
            ) {
                try playerTrack = AVAudioPlayer(
                    contentsOf: URL(fileURLWithPath: audioPath)
                )
            }
        } catch {
            print("Error")
        }
        playerTrack.play()
    }

    /// реализация функионала для кнопки share
    @IBAction func shareButton(_ sender: UIButton) {
        let activity = URL(filePath: Bundle.main.path(forResource: songs[numberSong], ofType: "mp3") ?? "")
        let shareController = UIActivityViewController(activityItems: [activity], applicationActivities: nil)
        shareController.popoverPresentationController?.sourceView = view

        present(shareController, animated: true)
    }

    /// закрытие плеера
    @IBAction func closedButton(_ sender: UIButton) {
        dismiss(animated: true)
        playerTrack.stop()
    }
}
