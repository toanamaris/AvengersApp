//
//  CharacterListCell.swift
//  AvengersApp
//
//  Created by Nguyen Toan on 25/05/2021.
//

import UIKit
import Kingfisher

class CharacterListCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        iconImageView.layer.cornerRadius = iconImageView.frame.height / 2
        iconImageView.clipsToBounds = true
        iconImageView.contentMode = .scaleAspectFill
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(name: String, thumbnail: String) {
        self.nameLabel.text = name
        guard let imageURl = URL(string: thumbnail) else {return}
        iconImageView?.kf.setImage(with: imageURl)
        
//        let image = UIImage(named: "example")!
//        imageView?.image = image

    }
    
}
