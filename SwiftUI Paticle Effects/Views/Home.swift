//
//  Home.swift
//  SwiftUI Paticle Effects
//
//  Created by Enigma Kod on 23/04/2023.
//

import SwiftUI

struct Home: View {
    @State private var isLiked: Bool = false
    @State private var isComment: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            Text("V Shaped")

            HStack(spacing: 20) {
                CustomButton(
                    systemImage: "suit.heart.fill",
                    status: isLiked,
                    activeColor: .pink,
                    inActiveColor: .gray,
                    particleType: ParticleType.Vshape
                ) {
                    isLiked.toggle()
                }

                CustomButton(
                    systemImage: "star.fill",
                    status: isComment,
                    activeColor: .yellow,
                    inActiveColor: .gray,
                    particleType: ParticleType.Vshape
                ) {
                    isComment.toggle()
                }
            }
        }
    }

    // Custom Button View
    @ViewBuilder
    func CustomButton(
        systemImage: String,
        status: Bool,
        activeColor: Color,
        inActiveColor: Color,
        particleType: ParticleType,
        onTap: @escaping () -> ()
    ) -> some View {
        Button(action: onTap) {
            Image(systemName: systemImage)
                .font(.title2)
                .particleEffect(
                    systemImage: systemImage,
                    font: .title2,
                    status: status,
                    activeTint: activeColor,
                    inActiveTint: inActiveColor,
                    particleType: particleType
                )
                .foregroundColor(status ? activeColor : inActiveColor)
                .padding(.horizontal, 18)
                .padding(.vertical, 8)
                .background {
                    Capsule()
                        .fill(status ? activeColor.opacity(0.25) : .gray.opacity(0.3))
                }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
