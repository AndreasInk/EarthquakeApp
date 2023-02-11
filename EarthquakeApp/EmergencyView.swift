//
//  EmergencyView.swift
//  EarthquakeApp
//
//  Created by Erik Schnell on 10.02.23.
//

import SwiftUI
import MapKit

struct EmergencyView: View {
    @State private var progress: CGFloat = 0
    @State private var idleAnimationpProgress: Bool = true
    let duration = 2.0
    var body: some View {
        ZStack {
//            Color.red
//            Color.white.opacity(0.4)
//                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                Text("Earthquake Alert")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
                Spacer()
//                Map(mapRect: .constant(.world))
//                    .cornerRadius(16)
//                    .frame(height: 200)
                Text("Press Button to send location.")
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                Button(action: shareLocation) {
                    Circle()
                        .fill(LinearGradient(colors: [Color.red.opacity(0.2), Color.white], startPoint: .top, endPoint: .bottom))
                        .frame(height: 100)
                        .overlay(
                            Image(systemName: "location")
                                .font(.system(size: 30, weight: .bold))
                                .foregroundColor(.red)
                        )
                        .overlay(
                            Circle()
                                .stroke(style: StrokeStyle(lineWidth: 3))
                                .foregroundColor(.red)
                        )
                        .overlay(
                            Circle()
                                .trim(from: 0, to: progress)
                                .stroke(style: StrokeStyle(lineWidth: 5))
                                .foregroundColor(.red)
                                .rotationEffect(Angle(degrees: -90))
                        )
//                        .overlay(
//                            Circle()
//                                .stroke(style: StrokeStyle(lineWidth: 4))
//                                .foregroundColor(.red.opacity(0.4))
//                                .opacity(idleAnimationpProgress ? 1.0 : 0.0)
//                                .scaleEffect(idleAnimationpProgress ? 1.3 : 1.0)
//                                .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: idleAnimationpProgress)
//                        )
//                        .onAppear {
//                            idleAnimationpProgress = false
//                        }
                        .shadow(color: .red.opacity(0.3), radius: 10)
//                        .onLongPressGesture(minimumDuration: duration) { pressing in
//                          print("pressing: \(pressing)")
//                          if pressing {
//                            withAnimation(.easeIn(duration: duration)) {
//                              progress = 1
//                            }
//                          } else {
//                            withAnimation(.easeIn(duration: duration/5.0)) {
//                              progress = 0
//                            }
//                          }
//                        } perform: {
//                          print("done")
//                          progress = 1
////                          isDone = true
//                        }
                }
                .buttonStyle(ScaleButtonStyle())
                

                Button("Share my Location", action: shareLocation)
            }
            .foregroundColor(.white)
            .padding()
        }
    }
    func shareLocation() {
        
    }
}

struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.default, value: configuration.isPressed)
    }
}


struct EmergencyView_Previews: PreviewProvider {
    static var previews: some View {
        EmergencyView()
    }
}
