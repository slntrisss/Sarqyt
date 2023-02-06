//
//  AlignmentGuide+Center.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 06.02.2023.
//

import Foundation
import SwiftUI

extension HorizontalAlignment{
    private struct CenterAlignment: AlignmentID{
        static func defaultValue(in dimensions: ViewDimensions) -> CGFloat {
            return dimensions[HorizontalAlignment.leading]
        }
        
    }
    
    static let centerAlignment = HorizontalAlignment(CenterAlignment.self)
}
