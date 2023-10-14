//
//  ViewController.swift
//  BarRaiser
//
//  Created by Farooque Azam on 14/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModel = BarRaiserSongViewModel()
    
    @IBOutlet weak var songTableView : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        registerCell()
        configureTableView()
        fetcSongList()
    }
}

extension ViewController {
    
    func configureTableView(){
        songTableView.delegate = self
        songTableView.dataSource = self
    }
    
    func registerCell(){
        let nib = UINib(nibName: BarRaiserSongListTableViewCell.identifier, bundle: nil)
        songTableView.register(nib, forCellReuseIdentifier: BarRaiserSongListTableViewCell.identifier)
    }
}


extension ViewController {
    
    private func fetcSongList(){
        viewModel.getSongData(resultType: BarRaiserSongModel.self) { [weak self] (success , error) in
            if success {
                DispatchQueue.main.async {
                    self?.songTableView.reloadData()
                }
            }else{
                // Error Alert
            }
            
        }
    }
}

extension ViewController : UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.songDetail?.songList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = songTableView.dequeueReusableCell(withIdentifier: BarRaiserSongListTableViewCell.identifier, for: indexPath) as! BarRaiserSongListTableViewCell
        let section = viewModel.songDetail?.songList?[indexPath.row]
        cell.songInfo = section
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = viewModel.songDetail?.songList?[indexPath.row]
        if let songInfo = section{
            didTapToPlaySong(songInfo: songInfo)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ViewController {
    
    
    private func didTapToPlaySong(songInfo : BarRaiserSongInfo){
        
        let storyboard = UIStoryboard(name: StoryBoardIdentifier.songDetailIdentifer, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: StoryBoardIdentifier.songDetailIStoryBoarddentifer) as! BarRaiserSongDetailViewController
        controller.songInfo = songInfo
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
}
