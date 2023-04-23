//
//  ParticleEffect.swift
//  SwiftUI Paticle Effects
//
//  Created by Enigma Kod on 23/04/2023.
//

import SwiftUI

extension View {
    @ViewBuilder
    func particleEffect(
        systemImage: String,
        font: Font,
        status: Bool,
        activeTint: Color,
        inActiveTint: Color,
        particleType: ParticleType
    ) -> some View {
        self.modifier(
            ParticleModifier(
                systemImage: systemImage,
                font: font,
                status: status,
                activeTint: activeTint,
                inActiveTint: inActiveTint,
                particleType: particleType
            )
        )
    }
}

private struct ParticleModifier: ViewModifier {
    var systemImage: String
    var font: Font
    var status: Bool
    var activeTint: Color
    var inActiveTint: Color
    var particleType: ParticleType

    @State private var particles: [ParticleModel] = []

    func body(content: Content) -> some View {
        content
            .overlay(alignment: .top) {
                ZStack {
                    ForEach(self.particles) { particle in
                        Image(systemName: self.systemImage)
                            .foregroundColor(self.status ? self.activeTint : self.inActiveTint)
                            .scaleEffect(particle.scale)
                            .offset(x: particle.randomX, y: particle.randomY)
                            .opacity(particle.opacity)
                            // Only Visible When Status is Active
                            .opacity(self.status ? 1 : 0)
                            // Making Base Visibillty With Zero Animation
                            .animation(.none, value: self.status)
                    }
                }
                .onAppear(perform: self.addParticales)
                .onChange(of: self.status) { newValue in
                    if !newValue { self.resetAllParticles() }
                    else {
                        switch self.particleType {
                            case .Vshape:
                                self.setParticlesForVshape()
                            case .RandomTop:
                                self.setParticlesForRandomTop()
                            case .RandomButtom:
                                self.setParticlesForRandomButtom()
                            case .AllRound:
                                self.setParticlesForRandomAllRoound()
                        }
                    }
                }
            }
    }

    func addParticales() {
        if self.particles.isEmpty {
            for _ in 1 ... 20 { self.particles.append(ParticleModel()) }
        }
    }

    func resetAllParticles() {
        for index in self.particles.indices {
            self.particles[index].reset()
        }
    }

    func setParticlesForVshape() {
        let totalCount = CGFloat(particles.count)
        for index in self.particles.indices {
            // Get Random X and Y Value based on Index
            let progress = CGFloat(index) / totalCount

            let maxX: CGFloat = (progress > 0.5) ? 100 : -100
            let maxY: CGFloat = 60

            let valueX: CGFloat = ((progress > 0.5 ? progress - 0.5 : progress) * maxX)
            let valueY: CGFloat = ((progress > 0.5 ? progress - 0.5 : progress) * maxY)

            let extraRandomnessX: CGFloat = (progress < 0.5 ? .random(in: 0 ... 10) : .random(in: -10 ... 0))
            let extraRandomnessY: CGFloat = .random(in: 0 ... 35)

            let randomScale: CGFloat = .random(in: 0.35 ... 1)

            self.performAnimation(
                index: index,
                randomX: valueX + extraRandomnessX,
                randomY: valueY + extraRandomnessY,
                randomScale: randomScale
            )

//            withAnimation(.interactiveSpring(
//                response: 0.6,
//                dampingFraction: 0.7,
//                blendDuration: 0.7
//            )) {
//                self.particles[index].randomX = valueX + extraRandomnessX
//                // the 35 is to make the baseline go up a bit so it dose not
//                // start from the center but at the top
//                self.particles[index].randomY = -(valueY + extraRandomnessY + 35)
//            }

//            withAnimation(.easeInOut(duration: 0.3)) {
//                self.particles[index].scale = randomScale
//            }

            // remove particle base on index
//            withAnimation(.interactiveSpring(
//                response: 0.6,
//                dampingFraction: 0.7,
//                blendDuration: 0.7
//            ).delay(0.25 + (Double(index) * 0.005))) {
//                self.particles[index].scale = 0.001
//            }
        }
    }

    func setParticlesForRandomTop() {}

    func setParticlesForRandomButtom() {}

    func setParticlesForRandomAllRoound() {}

    func performAnimation(
        index: Int,
        randomX: CGFloat,
        randomY: CGFloat,
        randomScale: CGFloat
    ) {
        withAnimation(.interactiveSpring(
            response: 0.6,
            dampingFraction: 0.7,
            blendDuration: 0.7
        )) {
            self.particles[index].randomX = randomX
            // the 35 is to make the baseline go up a bit so it dose not
            // start from the center but at the top
            self.particles[index].randomY = -(randomY + 35)
        }

        withAnimation(.easeInOut(duration: 0.3)) {
            self.particles[index].scale = randomScale
        }

        // remove particle base on index
        withAnimation(.interactiveSpring(
            response: 0.6,
            dampingFraction: 0.7,
            blendDuration: 0.7
        ).delay(0.25 + (Double(index) * 0.005))) {
            self.particles[index].scale = 0.001
        }
    }
}

struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
