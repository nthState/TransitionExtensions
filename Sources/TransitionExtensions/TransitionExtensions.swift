//
//  TransitionExtensions.swift
//  TransitionExtensions
//
//  Copyright © 2022 Chris Davis, https://www.nthState.com
//
//  See https://github.com/nthState/TransitionExtensions/blob/master/LICENSE for license information.
//

import SwiftUI

extension AnyTransition {

  static func translate(along path: Path) -> AnyTransition {
    AnyTransition.modifier(active: TranslateAlongPath(percent: 1, path: path),
                           identity: TranslateAlongPath(percent: 0, path: path))
  }
  
}

struct TranslateAlongPath: GeometryEffect {
  
  /// is a percentage
  var percent: CGFloat = 0
  
  var path: Path
  
  var animatableData: CGFloat {
    get { percent }
    set { percent = newValue }
  }
  
  func effectValue(size: CGSize) -> ProjectionTransform {
    let point = path.trimmedPath(from: 0, to: percent).currentPoint ?? .zero
    return ProjectionTransform(CGAffineTransform(translationX: point.x, y: point.y))
  }
  
}
