//
//  AnimalThumb.swift
//  PixelPeople
//
//  Created by Eric Carroll on 6/27/20.
//  Copyright © 2020 Eric Carroll. All rights reserved.
//

import SwiftUI

struct TuneThumb: View {
    @Binding var showDetail: Bool
    
    var tune: LooneyTune
    
    var body: some View {
        Button(action: {
            self.showDetail.toggle()
            index = self.tune.name
        }) {
            VStack {
                Image(tune.image)
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .scaledToFit()
                    .background(Color.black)
                Text(tune.name)
                    .scaledFont(name: "Georgia", size: 8)
                    .foregroundColor(Color.white)
            }
        }
    }
}

struct TuneThumb_Previews: PreviewProvider {
    static let tunes: [LooneyTune] = Bundle.main.decode([LooneyTune].self, from: "LooneyTunes.json")
    static var previews: some View {
        TuneThumb(showDetail: .constant(true), tune: tunes[0])
    }
}
