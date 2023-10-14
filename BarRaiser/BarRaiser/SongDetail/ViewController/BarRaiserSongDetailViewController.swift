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
    var audioPlayer = AVAudioPlayer()

    @IBOutlet weak var songNameLbl: UILabel!
    @IBOutlet weak var songImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        songNameLbl.text = songInfo?.name ?? ""
        songImageView.image = UIImage(named: songInfo?.imageName ?? "")
       
        audioPlayer = try! AVAudioPlayer(contentsOf: URL(string:  songInfo?.songUrl ?? "")!)
        audioPlayer.play()
    }
    
}

