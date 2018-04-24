//
//  XCTestCase.swift
//  CloudyTests
//
//  Created by Tanin on 24/04/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import XCTest

extension XCTestCase {
    
    func loadStubFromBundle(withName name: String, extension: String) -> Data {
        
        let bundle = Bundle(for: classForCoder)
        let url = bundle.url(forResource: name, withExtension: `extension`)
        
        // we use force unwrap as it's for unit test. We won't bother writing an error handling code
        return try! Data(contentsOf: url!)
        
    }
    
}
