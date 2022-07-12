//
//  ViewController.swift
//  MixedFlowTest
//
//  Created by Wyatt on 7/11/22.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
  
  var presentedNav: UINavigationController?

  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    
    view.addSubview(titleLabel)
    view.addSubview(nextButton)
    
    NSLayoutConstraint.activate([
      titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 400),
      
      nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      nextButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 60),
    ])
  }

  var titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "ViewController"
    return label
  }()
  
  var nextButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Go To SwiftUI", for: .normal)
    button.setTitleColor(.blue, for: .normal)
    button.addTarget(self, action: #selector(didTapNext), for: .touchUpInside)
    return button
  }()
  
  @objc
  func didTapNext() {
    let model = ContentModel(closeFlow: doCloseSwiftUIFlow,
                             completeFlow: doContinueFromSwiftUIFlow)
    let contentView = ContentView(model: model)
    let hostingView = UIHostingController(rootView: contentView)
    hostingView.view.insetsLayoutMarginsFromSafeArea = false

    let nav = UINavigationController(rootViewController: hostingView)
    nav.modalPresentationStyle = .fullScreen
    present(nav, animated: true)
    presentedNav = nav
  }
  
  func doCloseSwiftUIFlow() {
    presentedNav?.dismiss(animated: true)
  }
  
  func doContinueFromSwiftUIFlow() {
    let viewController = SecondViewController()
    presentedNav?.setNavigationBarHidden(false, animated: false)
    presentedNav?.pushViewController(viewController, animated: true)
  }
}
