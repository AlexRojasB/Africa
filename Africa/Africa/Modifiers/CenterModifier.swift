//
//  CenterModifier.swift
//  Africa
//
//  Created by Macbook on 4/11/21.
//

import SwiftUI

struct CenterModifier : ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
