//
//  TransitionExtensions.swift
//  TransitionExtensions
//
//  Copyright © 2022 Chris Davis, https://www.nthState.com
//
//  See https://github.com/nthState/TransitionExtensions/blob/main/LICENSE for license information.
//

import SwiftUI

public extension AnyTransition {

  static func translate(along path: Path) -> AnyTransition {
    AnyTransition.modifier(active: TranslateAlongPath(percent: 1, path: path),
                           identity: TranslateAlongPath(percent: 0, path: path))
  }
  
}

public struct TranslateAlongPath: GeometryEffect {
  
  /// How far along the `Path` we should be
  var percent: CGFloat = 0
  /// The `Path` to translate along
  var path: Path
  
  public var animatableData: CGFloat {
    get { percent }
    set { percent = newValue }
  }
  
  public func effectValue(size: CGSize) -> ProjectionTransform {
    let point = path.trimmedPath(from: 0, to: percent).currentPoint ?? .zero
    return ProjectionTransform(CGAffineTransform(translationX: point.x, y: point.y))
  }
  
}
