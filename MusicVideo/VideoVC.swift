//
//  VideoVC.swift
//  MusicVideo
//
//  Created by Shengyu Cao on 5/9/17.
//  Copyright © 2017 Shengyu Cao. All rights reserved.
//

import UIKit

class VideoVC: UIViewController {

    @IBOutlet weak var youTubeView: UIWebView!
    
    @IBOutlet weak var youTubeLable: UILabel!
    
    private var _songSource: SongSource!
    
    var songSource: SongSource {
        
        get{
            return _songSource
        } set {
            _songSource = newValue
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        youTubeLable.text = songSource.videoTitle
        youTubeView.loadHTMLString(songSource.videoURL, baseURL: nil)
    }


    
    
}
