//
//  ScanData.swift
//  LearningVision
//
//  Created by Andini Malavika on 17/05/24.
//

import Foundation

struct ScanData: Identifiable {
    var id = UUID()
    let content: String
    
    init(content: String) {
        self.content = content
        
    }
}
