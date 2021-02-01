//
//  ColorChangeCard.swift
//  Roman_ArrieroT7
//
//  Created by user176695 on 03/11/2020.
//

import SwiftUI

class ColorChangeCard: ObservableObject {
    
    @Published var buttonRed: Bool = false
    @Published var buttonGreen: Bool = false
    @Published var buttonPink: Bool = false
    @Published var buttonOrange: Bool = false
    @Published var buttonPurple: Bool = false
}
