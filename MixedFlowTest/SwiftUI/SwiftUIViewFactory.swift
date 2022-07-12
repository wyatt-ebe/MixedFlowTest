//
//  SwiftUIViewFactory.swift
//  MixedFlowTest
//
//  Created by Wyatt on 7/11/22.
//

import Foundation
import SwiftUI

struct SwiftUIViewFactory {
  func makeViewController(closeFlow: @escaping () -> Void,
                          completeFlow: @escaping () -> Void) -> UIViewController {
    let model = FlowModel(closeFlow: closeFlow,
                          completeFlow: completeFlow)
    let view = First(model: model)
    return UIHostingController(rootView: view)
  }
}
