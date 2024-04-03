//
//  RadialView.swift
//  MiracleCircle5
//
//  Created by 윤범태 on 4/3/24.
//

import SwiftUI

@available(iOS 16.0, *)
struct RadialView: View {
  let icons = ["calendar", "message", "figure.walk", "music.note"]
  let numbers = [12,1,2,3,4,5,6,7,8,9,10,11]
  
  var body: some View {
    ZStack {
      // Hours
      RadialLayout {
        ForEach(numbers, id: \.self) { number in
          Text("\(number)")
            .font(.system(.title, design: .rounded))
            .bold()
            .foregroundStyle(.black)
        }
      }
      .frame(width: 240)
      .background(.yellow.opacity(0.5))
      
      // Icons
      RadialLayout {
        ForEach(icons, id: \.self) { item in
          Circle()
            .frame(width: 44)
            .overlay {
              Image(systemName: item)
                .foregroundStyle(.white)
            }
        }
      }
      .frame(width: 120)
      .background(.cyan.opacity(0.3))
      
      // Minutes
      RadialLayout {
        ForEach(numbers, id: \.self) { item in
          Text("\(item * 5)")
            .font(.system(.caption, design: .rounded))
            .foregroundColor(.black)
        }
      }
      .frame(width: 360)
      .background(.yellow.opacity(0.3))
      
      Circle()
        .strokeBorder(.black, style: StrokeStyle(lineWidth: 10, dash: [1, 10]))
        .frame(width: 220)
        .background(.purple.opacity(0.1))
    }
  }
}

#Preview {
  return if #available(iOS 16.0, *) {
    RadialView()
  } else {
    EmptyView()
  }
}
