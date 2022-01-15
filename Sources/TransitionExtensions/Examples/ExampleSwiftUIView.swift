//
//  SwiftUIView.swift
//  TransitionExtensions
//
//  Copyright © 2022 Chris Davis, https://www.nthState.com
//
//  See https://github.com/nthState/TransitionExtensions/blob/master/LICENSE for license information.
//


import SwiftUI

internal struct ExampleSwiftUIView {
  @State var animate: Bool = false
}

extension ExampleSwiftUIView: View {
  
  func translationgPath() -> Path {
    Curve()
      .path(in: CGRect(x: 0, y: 0, width: 200, height: 200))
  }
  
  var body: some View {
    VStack {
      HStack {
        if animate {
          Text("Hello, Mars!")
        } else {
          Text("Hello, Earth!")
            .transition(.translate(along: translationgPath()).animation(.easeInOut(duration: 3)))
        }
      }
      .padding(24)
      
      Button {
        withAnimation {
          animate.toggle()
        }
      } label: {
        Text("Toggle Animation")
      }
      
    }
  }
  
}

struct ExampleSwiftUIView_Previews: PreviewProvider {
  static var previews: some View {
    ExampleSwiftUIView()
  }
}
