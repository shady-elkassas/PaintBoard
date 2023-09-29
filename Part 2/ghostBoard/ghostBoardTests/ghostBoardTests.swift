//
//  ghostBoardTests.swift
//  ghostBoardTests
//
//  Created by Shady Elkassas on 27/09/2023.
//

import XCTest
@testable import ghostBoard

class PaintViewModelTests: XCTestCase {

    var viewModel: PaintViewModel!

    override func setUp() {
        super.setUp()
        viewModel = PaintViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testAddLine() {
        
        //Given
        let color = "Red"
        let points: [CGPoint] = [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 1)]

        let expectation = XCTestExpectation(description: "Line added")

        //When
        viewModel.addLine(color: color, points: points)

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 2.0) //timeout
        
        
        // Then
        XCTAssertEqual(viewModel.lines.count, 1, "Line was not added to the ViewModel")
        XCTAssertEqual(viewModel.lines.first?.color, color, "Line color is incorrect")
        XCTAssertEqual(viewModel.lines.first?.points, points, "Line points are incorrect")
    }

    func testAddMultipleLines() {
        // Given
        let color1 = "Red"
        let points1: [CGPoint] = [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 1)]

        let color2 = "Blue"
        let points2: [CGPoint] = [CGPoint(x: 2, y: 2), CGPoint(x: 3, y: 3)]
        
        let expectation = XCTestExpectation(description: "Line added")

        // When
        viewModel.addLine(color: color1, points: points1)
        viewModel.addLine(color: color2, points: points2)

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 2.0) //timeout
        
        // Then
        XCTAssertEqual(viewModel.lines.count, 2, "Lines were not added to the ViewModel")
        XCTAssertEqual(viewModel.lines[0].color, color1, "First line color is incorrect")
        XCTAssertEqual(viewModel.lines[0].points, points1, "First line points are incorrect")
        XCTAssertEqual(viewModel.lines[1].color, color2, "Second line color is incorrect")
        XCTAssertEqual(viewModel.lines[1].points, points2, "Second line points are incorrect")
    }
}
