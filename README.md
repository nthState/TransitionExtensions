# Chris's SwiftUI Transition Extensions

An extension to `transition` that lets you translate in/out views along a `Path`

```
import SwiftUI
import TransitionExtensions

struct SwiftUIView {
  @State var animate: Bool = false
}

extension SwiftUIView: View {
  
  var path -> Path {
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
            .transition(.translate(along: path).animation(.easeInOut(duration: 3)))
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


## Documentation

Documentation website here: https://nthstate.github.io/TransitionExtensions/documentation/transitionextensions/

Building the docs

```
swift build
```

```
PACKAGE_NAME=TransitionExtensions
REPOSITORY_NAME=TransitionExtensions
OUTPUT_PATH=./docs

swift package --allow-writing-to-directory $OUTPUT_PATH \
    generate-documentation --target $PACKAGE_NAME \
    --disable-indexing \
    --transform-for-static-hosting \
    --hosting-base-path $REPOSITORY_NAME \
    --output-path $OUTPUT_PATH
 ```