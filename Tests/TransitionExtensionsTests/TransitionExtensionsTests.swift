//
//  TransitionExtensionsTests.swift
//  TransitionExtensions
//
//  Copyright © 2022 Chris Davis, https://www.nthState.com
//
//  See https://github.com/nthState/TransitionExtensions/blob/main/LICENSE for license information.
//


import XCTest
import SwiftUI
@testable import TransitionExtensions

final class TransitionExtensionsTests: XCTestCase {
  
  func test_translatedd_point() throws {
    
    let shape = Rectangle()
    
    let path = shape.path(in: CGRect(origin: .zero, size: CGSize(width: 100, height: 100))).trimmedPath(from: 0, to: 0.5)
    
    let actual = TranslateAlongPath(percent: 0.5, path: path).path.currentPoint
    
    let expected = CGPoint(x: 100, y: 100)
    
    XCTAssertEqual(actual, expected, "point should match")
  }
  
}
