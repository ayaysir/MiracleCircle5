//
//  TonicTest.swift
//  MiracleCircle5Tests
//
//  Created by 윤범태 on 4/5/24.
//

import XCTest
@testable import Tonic

final class TonicTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_LiterallyAnythingTest() throws {
        print("========", #function, "========")
        let chord = Chord(.C, type: .majorSeventh, inversion: 1)
        print(chord.notes(octave: 4), chord.inversion) // [E4, G4, B4, C5] 1
        
        if let chord2 = Chord(notes: [.D, .Fs, .A, .C]) {
            print("[.D, .Fs, .A, .C]:", chord2)
        }
        
        let notes: [Note] = [
            .init(index: 0), // C𝄫-1
            .init(pitch: Pitch(64)),
            .init(pitch: Pitch(58), key: .Bbm)
        ]
        
        notes.forEach {
            print("notes:", $0)
        }
        
        print("Letter.E.baseNote:", Letter.E.baseNote)
        
        let c = NoteClass(.C)
        print(c.intValue)
        (0...12).forEach {
            print(NoteClass(intValue: $0))
        }
        
        print("==============================================")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
