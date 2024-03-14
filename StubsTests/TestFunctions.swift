//
//  TestFunctions.swift
//  StubsTests
//
//  Created by christian on 3/14/24.
//

import Foundation

struct TestFunctions{
    // Generate a random string from 0 to 25 characters in length
    func randomString() -> String {
        let characters =
        """
        abcdefghijklmnopqrstuvwxyz
        ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789
        ,./?!@#$%^&*()_-+=;:'\"
        """
        let randomLength = Int.random(in: 0...25)
        let randomString = String(
            (0..<randomLength)
                .map {_ in
                    characters.randomElement()!
        }
        )
        return randomString
    }
}
