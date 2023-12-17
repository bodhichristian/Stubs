//
//  TicketShape.swift
//  Stubs
//
//  Created by christian on 12/9/23.
//

import Foundation
import SwiftUI

struct StubShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            // MARK: Starting position
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            
            // MARK: Leading Edge
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY * 0.1))
            
            path.addQuadCurve(
                to: CGPoint(x: rect.minX, y: rect.maxY * 0.3),
                control: CGPoint(x: rect.midX * 0.1, y: rect.maxY * 0.2))
            
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY * 0.4))
            
            path.addQuadCurve(
                to: CGPoint(x: rect.minX, y: rect.maxY * 0.6),
                control: CGPoint(x: rect.midX * 0.1, y: rect.midY))
            
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY * 0.7))
            
            path.addQuadCurve(
                to: CGPoint(x: rect.minX, y: rect.maxY * 0.9),
                control: CGPoint(x: rect.midX * 0.1, y: rect.maxY * 0.8))
            
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            
            
            // MARK: Bottom Edge
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            
            
            // MARK: Trailing Edge
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY * 0.9))
    
            path.addQuadCurve(
                to: CGPoint(x: rect.maxX, y: rect.maxY * 0.7),
                control: CGPoint(x: rect.maxX * 0.95, y: rect.maxY * 0.8))
            
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY * 0.6))
            
            path.addQuadCurve(
                to: CGPoint(x: rect.maxX, y: rect.maxY * 0.4),
                control: CGPoint(x: rect.maxX * 0.95, y: rect.maxY * 0.5))
            
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY * 0.3))
            
            path.addQuadCurve(
                to: CGPoint(x: rect.maxX, y: rect.maxY * 0.1),
                control: CGPoint(x: rect.maxX * 0.95, y: rect.maxY * 0.2))
            
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        }
    }
}
