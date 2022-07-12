//
//  Views.swift
//  MixedFlowTest
//
//  Created by Wyatt on 7/11/22.
//

import Foundation
import SwiftUI

struct First: View {
  @StateObject var model: FlowModel
  
  var body: some View {
    NavigationView() {
      VStack(spacing: 16) {
        Text("This is FirstView")
        NavigationLink("Go To Second",
                       isActive: $model.secondIsActive) {
          Second(model: model)
        }
                       .isDetailLink(false)
        Text("Exit SwiftUI")
          .foregroundColor(.blue)
          .onTapGesture {
            model.closeFlow()
          }
      }
    }
    .navigationBarHidden(true)
  }
}

struct Second: View {
  @ObservedObject var model: FlowModel
  
  var body: some View {
    VStack(spacing: 16) {
      Text("This is SecondView")
      NavigationLink("Go To Third",
                     isActive: $model.thirdIsActive) {
        Third(model: model)
      }
                     .isDetailLink(false)
      Text("Dismiss")
        .foregroundColor(.blue)
        .onTapGesture {
          model.secondIsActive.toggle()
        }
    }
  }
}

struct Third: View {
  @ObservedObject var model: FlowModel
  
  var body: some View {
    VStack(spacing: 16) {
      Text("This is ThirdView")
      Text("Complete SwiftUI Flow")
        .foregroundColor(.blue)
        .onTapGesture {
          model.completeFlow()
        }
      Text("Dismiss")
        .foregroundColor(.blue)
        .onTapGesture {
          model.thirdIsActive.toggle()
        }
      Text("Dismiss SecondView")
        .foregroundColor(.blue)
        .onTapGesture {
          model.secondIsActive.toggle()
        }
    }
  }
}
