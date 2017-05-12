//
//  MainVC.swift
//  MusicVideo
//
//  Created by Shengyu Cao on 5/9/17.
//  Copyright © 2017 Shengyu Cao. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var songs = [SongSource]()
    
    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let s1 = SongSource(imageURL: "https://maxcdn.icons8.com/Share/icon/color/Programming//swift1600.png", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/K89-RLzYxQM\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Swift1")
        let s2 = SongSource(imageURL: "https://maxcdn.icons8.com/Share/icon/ios7/Programming//swift1600.png", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/K89-RLzYxQM\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Swift2")
        let s3 = SongSource(imageURL: "https://maxcdn.icons8.com/office/PNG/512/Logos/swift_80-512.png", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/K89-RLzYxQM\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Swift3")
        
        songs.append(s1)
        songs.append(s2)
        songs.append(s3)
        
    }
    


    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath) as? SongCell {
            
            let song = songs[indexPath.row]
            
            cell.updateUI(songSource: song)
            
            return cell
            
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let song = songs[indexPath.row]
        
        performSegue(withIdentifier: "VideoVC", sender: song)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoVC{
            
            if let song = sender as? SongSource {
                
                destination.songSource = song
            }
            

        }
    }

    
    
    
}

