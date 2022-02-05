import SwiftUI
import TransitionExtensions

struct MyView: View {
  
  var path -> Path {
    Rectangle()
      .path(in: CGRect(x: 0, y: 0, width: 200, height: 200))
  }
  
  var body: some View {
    VStack {
      HStack {
        if animate {
          Text("Hello, Mars!")
        } else {
          Text("Hello, Earth!")
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
