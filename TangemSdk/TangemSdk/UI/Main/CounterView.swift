//
//  CounterView.swift
//  TangemSdk
//
//  Created by Alexander Osokin on 23.07.2021.
//  Copyright © 2021 Tangem AG. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
struct CounterView: View {
    var currentDelay: Int
    var totalDelay: Int
    
    @EnvironmentObject var style: TangemSdkStyle
    
    private var itemHeight: CGFloat { style.textSizes.indicatorLabel + 8 }
    private var range: Range<Int> { Range(0...totalDelay) }
    
    var body: some View {
        ZStack {
            ZStack {
                VStack(spacing: 0) {
                    ForEach(range) { index in
                        Text("\(index)")
                            .font(.system(size: style.textSizes.indicatorLabel,
                                          weight: .medium,
                                          design: .default)
                                    .monospacedDigit())
                            .foregroundColor(style.colors.tint)
                            .frame(height: itemHeight)
                    }
                }
                .offset(y: CGFloat(totalDelay) * itemHeight / 2)
                .offset(y: -CGFloat(currentDelay) * itemHeight)
                .animation(.spring(dampingFraction: 0.7).speed(1.5))
            }
            .frame(width: 100, height: itemHeight)
            .clipped()
        }
//                .onAppear {
//                    _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
//                        withAnimation() {
//                            self.currentDelay -= 1
//
//                            if self.currentDelay == 0 {
//                                timer.invalidate()
//                            }
//                        }
//                    }
//                }
    }
}

@available(iOS 13.0, *)
struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView(currentDelay: 4, totalDelay: 5)
            .environmentObject(TangemSdkStyle())
    }
}
