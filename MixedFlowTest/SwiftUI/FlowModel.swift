//
//  FlowModel.swift
//  MixedFlowTest
//
//  Created by Wyatt on 7/11/22.
//

import Foundation

class FlowModel: ObservableObject {
  @Published var secondIsActive: Bool = false {
    didSet {
      print("secondIsActive didSet: \(secondIsActive)")
    }
  }
  @Published var thirdIsActive: Bool = false {
    didSet {
      print("thirdIsActive didSet: \(thirdIsActive)")
    }
  }
  
  var closeFlow: () -> Void
  var completeFlow: () -> Void
  
  init(closeFlow: @escaping () -> Void,
       completeFlow: @escaping () -> Void) {
    self.closeFlow = closeFlow
    self.completeFlow = completeFlow
  }
}
