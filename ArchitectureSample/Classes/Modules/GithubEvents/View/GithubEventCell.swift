//
//  GithubEventCell.swift
//  ArchitectureSample
//
//  Created by Manas Chaudhari on 12/25/16.
//  Copyright © 2016 Manas Chaudhari. All rights reserved.
//

import UIKit

class GithubEventCell: UITableViewCell {
    
    @IBOutlet weak var typeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(forEvent event: GithubEvent) {
        self.typeLabel.text = "Type: " + event.type
    }

}
