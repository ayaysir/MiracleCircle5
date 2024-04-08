//
//  RadialView2.swift
//  MiracleCircle5
//
//  Created by 윤범태 on 4/3/24.
//

import SwiftUI
import Tonic

struct RadialView2: View {
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
  
  @State private var statusText = "StatusText"
  
  func setStatusText(_ key: NoteClass, type: ChordType) {
    let chord = Chord(key, type: type)
    statusText = "\(chord.description): \(chord.noteClasses.description)"
  }
  
  var body: some View {
    VStack {
      Text(statusText)
        .font(.title)
      if #available(iOS 16.0, *) {
        ZStack {
          RadialLayout {
            ForEach(notesWithStep5, id: \.self) { key in
              Button {
                setStatusText(key, type: .majorSeventh)
              } label: {
                Text("\(key)")
                  .font(.system(size: 24, weight: .bold))
              }
              .foregroundStyle(.primary)
            }
          }
          .frame(width: 480)
          
          RadialLayout {
            ForEach(notesWithStep5.indices, id: \.self) { index in
              let adjustedIndex = (index + 3) % 12
              Button {
                setStatusText(notesWithStep5[adjustedIndex], type: .minorSeventh)
              } label: {
                Text("\(notesWithStep5[adjustedIndex])m")
                  .font(.system(size: 16, weight: .semibold, design: .monospaced))
              }
              .foregroundStyle(.primary)
            }
          }
          .frame(width: 360)
          
          RadialLayout {
            ForEach(notesWithStep5.indices, id: \.self) { index in
              let adjustedIndex = (index + 5) % 12
              Button {
                setStatusText(notesWithStep5[adjustedIndex], type: .diminishedSeventh)
              } label: {
                Text("\(notesWithStep5[adjustedIndex])°")
                  .font(.system(size: 16, weight: .medium))
              }
              .foregroundStyle(.primary)
            }
          }
          .frame(width: 250)
          
          Circle()
            .strokeBorder(.black, style: StrokeStyle(lineWidth: 8, dash: [1, 10]))
            .frame(width: 390)
            
          Circle()
            .strokeBorder(.gray, style: StrokeStyle(lineWidth: 2.5))
            .frame(width: 278.5)
          
          Circle()
            .strokeBorder(.indigo, style: StrokeStyle(lineWidth: 2.5))
            .frame(width: 207)
          
          ForEach(0..<5) { index in
            Circle()
              .strokeBorder(.green, style: StrokeStyle(lineWidth: 2.5))
              .frame(width: 130 - CGFloat(20 * index))
          }
        }
      } else {
        EmptyView()
      }
    }
    
  }
}

#Preview {
  RadialView2()
}
