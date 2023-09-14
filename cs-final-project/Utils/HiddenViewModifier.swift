//
//  HiddenViewModifier.swift
//  cs-final-project
//
//  Created by Nicol Luis Yumang on 8/26/23.
//

import Foundation
import SwiftUI


/// A view modifier that presents a blank view when bool argument is true
struct HiddenModifier: ViewModifier {
    
    let isHidden: Bool
    
    func body(content: Content) -> some View {
        if isHidden {
            
        } else {
            content
        }
    }
}


extension View {
    func isHidden(_ bool: Bool) -> some View {
        modifier(HiddenModifier(isHidden: bool))
    }
}
