//
//  DragActionView.swift
//  MiracleCircle5
//
//  Created by 윤범태 on 3/31/24.
//

import SwiftUI

struct DragActionView: View {
  let icons = [
    "photo.fill",
    "f.cursive.circle.fill",
    "house.fill",
    "figure.wave",
    "airplane",
  ]
  
  // 화면을 그리드형식으로 꽉채워줌
  var columns: [GridItem] {
    return (1...3).map { _ in
      GridItem(.flexible(), spacing: 30)
    }
  }
  
  @GestureState private var dragLocation: CGPoint = .zero
  @State var currentButtonIndex = -1
  
  func dragObserver(value: Any? = nil) -> some View {
    GeometryReader { geometry in
      _dragObserver(geometry: geometry, value: value)
    }
  }
  
  private func _dragObserver(geometry: GeometryProxy, value: Any?) -> some View {
    if geometry.frame(in: .global).contains(dragLocation) {
      DispatchQueue.main.async {
        withAnimation {
          if let value = value as? Int {
            currentButtonIndex = value
          } else {
            currentButtonIndex = -1
          }
        }
      }
    }
    
    return Rectangle().fill(.clear)
  }
  
  var body: some View {
    Text("\(currentButtonIndex >= 0 ? icons[currentButtonIndex % 5] : "ready")")
    LazyVGrid(columns: columns, spacing: 30) {
      ForEach(0..<15) { index in
        Button {
          
        } label: {
          Image(systemName: icons[index % 5])
            .resizable()
            .scaledToFit()
            .frame(height: currentButtonIndex == index ? 70 : 65)
            .foregroundStyle(.white.opacity(currentButtonIndex == index ? 1 : 0.9))
        }
        .frame(width: 100, height: 100)
        .background(currentButtonIndex == index ? .yellow : .orange)
        .background(dragObserver(value: index))
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))
        .controlSize(.large)
        .highPriorityGesture( DragGesture(minimumDistance: 0, coordinateSpace: .global)
          .updating($dragLocation) { value, state, _ in
            state = value.location
          })
        
      }
    }
    // 버튼 사이의 빈 공간을 눌렀을 때 인식
    .background(dragObserver(value: nil))
  }
}

#Preview {
  DragActionView()
}
