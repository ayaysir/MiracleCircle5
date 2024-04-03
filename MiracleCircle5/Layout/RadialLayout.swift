//
//  RadialLayout.swift
//  MiracleCircle5
//
//  Created by 윤범태 on 4/3/24.
//

import SwiftUI

@available(iOS 16.0, *)
struct RadialLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        proposal.replacingUnspecifiedDimensions()
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let radius = bounds.width / 3.0
        let angle: CGFloat = Angle.degrees(360.0 / CGFloat(subviews.count)).radians
        
        subviews.enumerated().forEach { index, subview in
            // Position
            var point = CGPoint(x: 0, y: -radius)
                .applying(.init(rotationAngle: angle * CGFloat(index)))
            
            // Center
            point.x += bounds.midX
            point.y += bounds.midY
            
            // Place subviews
            subview.place(at: point, anchor: .center, proposal: .unspecified)
        }
    }
}
