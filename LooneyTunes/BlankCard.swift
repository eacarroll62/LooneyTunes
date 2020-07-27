//
//  FilterEntity.swift
//  PixelPeople
//
//  Created by Eric Carroll on 6/29/20.
//  Copyright © 2020 Eric Carroll. All rights reserved.
//

import SwiftUI

struct BlankCard: View {
    var body: some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.mediumSlateBlue)
                    .frame(width: 320, height: 520)
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.black)
                    .frame(width: 304, height: 504)
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.mediumPurple)
                    .frame(width: 300, height: 500)
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.metallicGold)
                    .frame(width: 244, height: 354)
                RoundedRectangle(cornerRadius: 10)
                    .fill(RadialGradient(gradient: Gradient(colors: [.whiteSmoke, .black]), center: .center, startRadius: 5, endRadius: 180))
                    .frame(width: 240, height: 350)
            }
        }
    }
}

struct BlankCard_Previews: PreviewProvider {
    static var previews: some View {
        BlankCard()
    }
}
