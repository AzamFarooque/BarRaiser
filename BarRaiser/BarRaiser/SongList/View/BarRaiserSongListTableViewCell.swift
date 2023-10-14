//
//  BarRaiserSongListTableViewCell.swift
//  BarRaiser
//
//  Created by Farooque Azam on 14/10/23.
//

import UIKit

class BarRaiserSongListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cntView: UIView!
    @IBOutlet weak var songImgView: UIImageView!
    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var songSingerName: UILabel!
    @IBOutlet weak var songType: UILabel!
    
    var songInfo : BarRaiserSongInfo? {
        didSet{
            guard let barRaiserSongInfo = songInfo else {return}
            songName.text = barRaiserSongInfo.name ?? ""
            songSingerName.text = barRaiserSongInfo.singerName ?? ""
            songType.text = barRaiserSongInfo.type ?? ""
            songImgView.image = UIImage(named: barRaiserSongInfo.imageName ?? "")
            
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        cntView.backgroundColor = .white
        cntView.layer.borderColor = UIColor.black.cgColor
        cntView.layer.borderWidth = 1.0
        cntView.layer.cornerRadius = 16.0
        
    }
}
