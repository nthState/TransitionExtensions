# Chris's SwiftUI TransitionExtensions

An extension to `transition` that lets you transition in/out views along a `Path`

```
import SwiftUI
import TransitionExtensions

struct SwiftUIView {
  @State var animate: Bool = false
}

extension SwiftUIView: View {
  
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

struct SwiftUIView_Previews: PreviewProvider {
  static var previews: some View {
    SwiftUIView()
  }
}

```
