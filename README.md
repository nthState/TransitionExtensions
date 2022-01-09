# Chris's SwiftUI TransitionExtensions

A description of this package.

```
import TransitionExtensions

struct SwiftUIView: View {

  private func translationPath() -> Path {
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
          .transition(.translate(along: translationPath()).animation(.easeInOut(duration: 3)))
        }
      }
    }
  }
}
```
