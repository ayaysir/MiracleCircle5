//
//  RadialView2.swift
//  MiracleCircle5
//
//  Created by 윤범태 on 4/3/24.
//

import SwiftUI

@available(iOS 16.0, *)
struct RadialView2: View {
  let keys = "C G D A E B F# Db Ab Eb Bb F".split(separator: " ")
  let keysForSharp = "C G D A E B F# C# G# D# A# E#".split(separator: " ")
  
  var body: some View {
    ZStack {
      RadialLayout {
        ForEach(keys, id: \.self) { key in
          Text("\(key)")
            .font(.system(size: 24, weight: .bold))
        }
      }
      .frame(width: 480)
      
      RadialLayout {
        ForEach(keysForSharp.indices, id: \.self) { index in
          Text("\(keysForSharp[(index + 3) % 12])")
            .font(.system(size: 20, weight: .semibold))
        }
      }
      .frame(width: 360)
      
      RadialLayout {
        ForEach(keysForSharp.indices, id: \.self) { index in
          Text("\(keysForSharp[(index + 5) % 12])")
            .font(.system(size: 16, weight: .medium))
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
  }
}

#Preview {
  return if #available(iOS 16.0, *) {
    RadialView2()
  } else {
    EmptyView()
  }
}
