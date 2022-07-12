//
//  SwiftUIFlow.swift
//  MixedFlowTest
//
//  Created by Wyatt on 7/11/22.
//

import Foundation
import SwiftUI

struct SwiftUIViewFactory {
  func makeView(closeFlow: @escaping () -> Void,
                completeFlow: @escaping () -> Void) -> some View {
    let model = ContentModel(closeFlow: closeFlow,
                             completeFlow: completeFlow)
    return ContentView(model: model)
  }
}

struct ContentView: View {
  @StateObject var model: ContentModel
  
  var body: some View {
    NavigationView() {
      VStack(spacing: 16) {
        Text("This is ContentView")
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

class ContentModel: ObservableObject {
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

struct Second: View {
  @ObservedObject var model: ContentModel
  
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
  @ObservedObject var model: ContentModel
  
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
