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
    
    @State private var isLiked2: Bool = false
    @State private var isComment2: Bool = false
    
    @State private var isLiked3: Bool = false
    @State private var isComment3: Bool = false
    
    @State private var isLiked4: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            HStack { Spacer() }

            VStack(alignment: .leading, spacing: 20) {
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
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Spread Top")
                
                HStack(spacing: 20) {
                    CustomButton(
                        systemImage: "suit.heart.fill",
                        status: isLiked2,
                        activeColor: .pink,
                        inActiveColor: .gray,
                        particleType: ParticleType.RandomTop
                    ) {
                        isLiked2.toggle()
                    }
                    
                    CustomButton(
                        systemImage: "star.fill",
                        status: isComment2,
                        activeColor: .yellow,
                        inActiveColor: .gray,
                        particleType: ParticleType.RandomTop
                    ) {
                        isComment2.toggle()
                    }
                }
            }
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Spread Buttom")
                
                HStack(spacing: 20) {
                    CustomButton(
                        systemImage: "suit.heart.fill",
                        status: isLiked3,
                        activeColor: .pink,
                        inActiveColor: .gray,
                        particleType: ParticleType.RandomButtom
                    ) {
                        isLiked3.toggle()
                    }
                    
                    CustomButton(
                        systemImage: "star.fill",
                        status: isComment3,
                        activeColor: .yellow,
                        inActiveColor: .gray,
                        particleType: ParticleType.RandomButtom
                    ) {
                        isComment3.toggle()
                    }
                }
            }
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Spread All Around")
                
                HStack(spacing: 20) {
                    CustomButton(
                        systemImage: "suit.heart.fill",
                        status: isLiked4,
                        activeColor: .pink,
                        inActiveColor: .gray,
                        particleType: ParticleType.AllRound
                    ) {
                        isLiked4.toggle()
                    }
                    
//                    CustomButton(
//                        systemImage: "star.fill",
//                        status: isComment4,
//                        activeColor: .yellow,
//                        inActiveColor: .gray,
//                        particleType: ParticleType.AllRound
//                    ) {
//                        isComment4.toggle()
//                    }
                }
            }
            
            Spacer()
        }
        .padding(.horizontal, 40)
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
                    Capsule().fill(
                        status ? activeColor.opacity(0.25) : .gray.opacity(0.3)
                    )
                }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
