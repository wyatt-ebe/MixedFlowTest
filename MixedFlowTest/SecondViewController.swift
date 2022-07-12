//
//  SecondViewController.swift
//  MixedFlowTest
//
//  Created by Wyatt on 7/11/22.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    
    view.addSubview(titleLabel)
    
    NSLayoutConstraint.activate([
      titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
    ])
  }
  
  var titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "SecondViewController"
    return label
  }()
}
