// PlayListViewController.swift
// Copyright © RoadMap. All rights reserved.

import AVFoundation
import UIKit

/// Экран Плейлиста
final class PlayListViewController: UIViewController {
    // MARK: - Enum

    private enum Constants {
        static let identifierForGriby = "playGriby"
        static let identifierForNiletto = "playNiletto"
    }

    // MARK: - @IBOutlets

    @IBOutlet var imageGriby: UIImageView!
    @IBOutlet var gribyNameLabel: UILabel!
    @IBOutlet var nameOfTheSonGribyLabel: UILabel!
    @IBOutlet var imageLubimka: UIImageView!
    @IBOutlet var nilettoNameLabel: UILabel!
    @IBOutlet var nameOfTheSonNiletto: UILabel!

    // MARK: - Methods

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? PlayerViewController,
              let imageGriby = imageGriby.image,
              let artistGriby = gribyNameLabel.text,
              let nameSonIsGriby = nameOfTheSonGribyLabel.text,
              let imageNiletto = imageLubimka.image,
              let artistNiletto = nilettoNameLabel.text,
              let nameSonIsNiletto = nameOfTheSonNiletto.text else { return }

        if segue.identifier == Constants.identifierForGriby {
            destination.imageArtist = imageGriby
            destination.nameArtist = artistGriby
            destination.nameSong = nameSonIsGriby

            do {
                if let audioPath = Bundle.main.path(
                    forResource: "griby-taet-ljod",
                    ofType: "mp3"
                ) {
                    try destination.playerTrack = AVAudioPlayer(
                        contentsOf: URL(fileURLWithPath: audioPath)
                    )
                }
            } catch {
                print("Error")
            }
            destination.playerTrack.play()

        } else if segue.identifier == Constants.identifierForNiletto {
            destination.imageArtist = imageNiletto
            destination.nameArtist = artistNiletto
            destination.nameSong = nameSonIsNiletto

            do {
                if let audioPath = Bundle.main.path(forResource: "niletto-ljubimka", ofType: "mp3") {
                    try destination.playerTrack = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                }
            } catch {
                print("Error")
            }
            destination.playerTrack.play()
        }
    }
}
