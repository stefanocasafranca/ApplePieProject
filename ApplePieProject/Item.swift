//
//  Item.swift
//  ApplePieProject
//
//  Created by Stefano Casafranca Laos on 9/24/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
