//
//  ChallengeCalculatorTests.swift
//  ChallengeCalculatorTests
//
//  Created by Eric Davenport on 12/2/19.
//  Copyright © 2019 Eric Davenport. All rights reserved.
//

import XCTest

// @testable isn acompiler directive - REQUIRED FOR TESTING - enables this test suite to have access to the challenge calculator modules - import entire folder - look in the   <<<<<<-----   navigator   <<<<<---------
@testable import ChallengeCalculator

// inherites from XCTestCse class - parent class = XCTestCase
class ChallengeCalculatorTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        print("setUp - called before each test is run")
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        print("tearDown - called after each test is completed")
    }
// MARK: REMOVED - NOT CURRENTLY USING BUT PLACED WHEN TEST FILE CREATED
//    func testExample() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
    // test function dos not take any parameters
    // test func does not return any values
    func testAddTwoNumbers() {
        // arrange your test in the following format
        
        // arrange(given) - set up constants, variables and the system under test
        let sut = Challenge()
        let num1 = 10
        let num2 = 5
        let expectedResult = 15
        
        // act(when) - prform workload
        let result = sut.addTwoNumbers(num1: num1, num2: num2)
        
        // assert(then) - test for given conditions
        XCTAssertEqual(expectedResult, result, "\(result) should be \(expectedResult)")
    }
    
    func testCalculateWeeklyTraining() {
        // arrange
        let sut = Challenge() // creating instnce of challenge
        let sutEpectedAverage = 2320  // feet elevation per week
        let metric = 11_602 // overall elevation challenge
        let numberOfWeeksForChallenge = 5  // vweeks
        
        // act
        let weekyhTraining = sut.calculateWeeklyTraining(for: Double(metric), and: numberOfWeeksForChallenge)
        
        // assert
        XCTAssertEqual(sutEpectedAverage, weekyhTraining, "\(weekyhTraining) should be equal to \(sutEpectedAverage)")
    }
    
    // write a test to validate that division by 0 returns -1
    // done in order to confirm gaurd statement in Challenge.swift works when dividing by 0
    func testCalculateifZero() {
        // arrange
        let sut = Challenge()
        let expectedValue = -1
        let metric = 11_602
        let numberOfWeeksForChallenges = 0
        
        // act
        let weeklyTraining = sut.calculateWeeklyTraining(for: Double(metric), and: numberOfWeeksForChallenges)
        
        // assert
        XCTAssertEqual(expectedValue, weeklyTraining, "\(weeklyTraining) should be equal to \(expectedValue)")
    }
    
    // TDD - Test driven developmemnt
    /*
     You start writing a unit test until it fails(or a complkier error),
        then go to production code e.g Challenge.swift file
     fix failure until the test passes, comtinue writing unit test until failure again
        and continue the cycle
     */
    func testAverageDailyMetric() {
        // arrange
        let sut = Challenge()
        let sutWeeklyTotalMetric = 2320  // total elevation
        let expectedDailyAverage = 773  // elevtion per day
        let numberOfWorkoutDays = 3   // days
        
        // act
        // averageTrainingPerWeek expects to retuen 773
        let averageDailyTraining = sut.averageTrainingPerWeek(challengeMetric: sutWeeklyTotalMetric, numberOfWorkoutDays: numberOfWorkoutDays)
        
        // assert
        XCTAssertEqual(expectedDailyAverage, averageDailyTraining, "\(averageDailyTraining) should equal to \(expectedDailyAverage)")
    }
//MARK: WHY ISNT IT A SEPERATED FUNCTION PROPERLY - PLACED CORRECTLY
//    func confirmWithinAmountOfDays() {
//        // aarrnge
//        let sut = Challenge()
//        let sutWeklyTotalMatric = 2320
//        let expectedDailyAverage = -1
//        let numberOfWorkoutDays = 10
//
//        // act
//        let average = sut.averageTrainingPerWeek(challengeMetric: sutWeklyTotalMatric, numberOfWorkoutDays: numberOfWorkoutDays)
//
//        // assert
//        XCTAssertEqual(expectedDailyAverage, average, "\(average) should equal to \(expectedDailyAverage)")
//    }
    

}




/*
 
 
 
 
 */
