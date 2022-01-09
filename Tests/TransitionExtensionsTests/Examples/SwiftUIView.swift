//
//  SwiftUIView.swift
//  TransitionExtensions
//
//  Copyright © 2022 Chris Davis, https://www.nthState.com
//
//  See https://github.com/nthState/TransitionExtensions/blob/master/LICENSE for license information.
//


import SwiftUI

struct SwiftUIView {
  @State var animate: Bool = false
}

extension SwiftUIView: View {

  func givePath() -> Path {
    Curve()
      .path(in: CGRect(x: 0, y: 0, width: 200, height: 200))
  }
  
  var body: some View {
    VStack {
      HStack {
        if animate {
          Text("blah")
            .zIndex(1)
        } else {
          Text("Hello, World!")
          .transition(.translate(along: givePath()).animation(.easeInOut(duration: 3)))
        }
      }
      
      Button {
        withAnimation {
          animate.toggle()
        }
      } label: {
        Text("Start")
      }
      
      Curve()
        .stroke(Color.green, lineWidth: 2)
        .frame(width: 200, height: 200)
      
    }
  }
  
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
