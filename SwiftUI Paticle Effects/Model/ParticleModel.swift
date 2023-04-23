//
//  ParticleModel.swift
//  SwiftUI Paticle Effects
//
//  Created by Enigma Kod on 23/04/2023.
//

import SwiftUI

enum ParticleType {
    case Vshape
    case RandomTop
    case RandomButtom
    case AllRound
}

struct ParticleModel: Identifiable {
    var id: UUID = .init()
    var randomX: CGFloat = 0
    var randomY: CGFloat = 0
    var scale: CGFloat = 1
    var opacity: CGFloat = 1

    mutating func reset() {
        randomX = 0
        randomY = 0
        scale = 1
        opacity = 1
    }
}
