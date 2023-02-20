//
//  mainVC.swift
//  Weather
//
//  Created by Doyeon on 2023/02/20.
//

import UIKit

class mainVC: UIViewController {
    
    let textLabel : UILabel = {
        let text = UILabel()
        
        text.text = "No Storyboard Check"
        text.textColor = .systemBlue
        text.translatesAutoresizingMaskIntoConstraints = false
        
        return text
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(textLabel)
        
        textLabelAutoLayout()
    }
}

extension mainVC {
    func textLabelAutoLayout() {
        NSLayoutConstraint.activate([
            self.textLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.textLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
    }
}
