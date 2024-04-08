//
//  InteractiveRadialView.swift
//  MiracleCircle5
//
//  Created by 윤범태 on 4/5/24.
//

import SwiftUI
import Tonic

struct InteractiveRadialView {
    let notesWithStep5: [NoteClass] = [
        .init(.C),
        .init(.G),
        .init(.D),
        .init(.A),
        .init(.E),
        .init(.B),
        .init(.F, accidental: .sharp),
        .init(.D, accidental: .flat),
        .init(.A, accidental: .flat),
        .init(.E, accidental: .flat),
        .init(.B, accidental: .flat),
        .init(.F),
    ]
}

extension InteractiveRadialView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    InteractiveRadialView()
}
