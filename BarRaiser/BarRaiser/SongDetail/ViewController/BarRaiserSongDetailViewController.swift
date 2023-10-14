//
//  BarRaiserSongDetailViewController.swift
//  BarRaiser
//
//  Created by Farooque Azam on 14/10/23.
//

import UIKit
import AVFoundation

class BarRaiserSongDetailViewController: UIViewController {
    var songInfo : BarRaiserSongInfo?
    var player = AVPlayer()

    @IBOutlet weak var songNameLbl: UILabel!
    @IBOutlet weak var songImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let songInfo = songInfo {
            songNameLbl.text = songInfo.name ?? ""
            songImageView.image = UIImage(named: songInfo.imageName ?? "")
            play(url : URL(string: songInfo.songUrl ?? "")!)
        }
    }
    
    func play(url: URL) {
        player = AVPlayer(url: url)
        player.allowsExternalPlayback = true
        player.appliesMediaSelectionCriteriaAutomatically = true
        player.automaticallyWaitsToMinimizeStalling = true
        player.volume = 1
        player.play()
    }
    
}

