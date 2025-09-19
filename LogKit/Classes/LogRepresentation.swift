//
//  LogRepresentation.swift
//  LogKit
//
//  Created by Georges Boumis on 07/10/2016.
// 
//  Licensed to the Apache Software Foundation (ASF) under one
//  or more contributor license agreements.  See the NOTICE file
//  distributed with this work for additional information
//  regarding copyright ownership.  The ASF licenses this file
//  to you under the Apache License, Version 2.0 (the
//  "License"); you may not use this file except in compliance
//  with the License.  You may obtain a copy of the License at
//  
//    http://www.apache.org/licenses/LICENSE-2.0
//  
//  Unless required by applicable law or agreed to in writing,
//  software distributed under the License is distributed on an
//  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
//  KIND, either express or implied.  See the License for the
//  specific language governing permissions and limitations
//  under the License.
//

import Foundation
import ContentKit
import RepresentationKit

public struct LogRepresentation: TextRepresentation {
    private let _string: String
    public var content: String {
        return "\(self._string)"
    }

    public init() {
        self.init("")!
    }

    public init?(_ string: String) {
        self._string = string
    }

    // gets key == "value" as value a String
    public func with<Key,Value>(key: Key, value: Value) -> AbzorbaRepresentation where Key: LosslessStringConvertible & Hashable {
        let string = self._string + "[\(Date())]: \(value)\n"
        return LogRepresentation(string)!
    }
}
