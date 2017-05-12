//
//  SongCell.swift
//  MusicVideo
//
//  Created by Shengyu Cao on 5/9/17.
//  Copyright © 2017 Shengyu Cao. All rights reserved.
//

import UIKit

class SongCell: UITableViewCell {

    @IBOutlet weak var videoPreviewImage: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    
    
    func updateUI(songSource: SongSource) {
        
        videoTitle.text = songSource.videoTitle
        
        let url = URL(string: songSource.imageURL)!
        
        DispatchQueue.global().async {
            
            do {
                
                let data = try Data(contentsOf: url)
                    
                DispatchQueue.global().sync {
                        
                    self.videoPreviewImage.image = UIImage(data: data)
                        
                }
            }catch {
                
                print ("error")
                
            }
            
            
            
        }
        

        
        
    }
    
    
    
}
