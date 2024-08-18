//
//  Color+GradientForeground.swift
//  EasiCash
//
//  Created by CHENGTAO on 8/17/24.
//
// Reference: https://github.com/thatvirtualboy/SwiftUI-Bento-Box/blob/main/SwiftUI-Bento-Box/Views/B2Box.swift

import SwiftUI

extension View {
    public func gradientForeground(colors: [Color]) -> some View {
        self.overlay(LinearGradient(gradient: .init(colors: colors),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing))
            .mask(self)
    }
}
