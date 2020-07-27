//
//  TuneDetailView.swift
//  LooneyTunes
//
//  Created by Eric Carroll on 7/26/20.
//  Copyright © 2020 Eric Carroll. All rights reserved.
//

import SwiftUI

struct TuneDetailView: View {
    @Binding var isPresented: Bool
    var tune: LooneyTune
    @State var text: String
    
    var body: some View {
        NavigationView {
            ZStack {
                BlankCard()
                Image(tune.image)
                    .resizable()
                    .frame(width: 192, height: 192)
                Group {
                    Text(tune.name)
                        .bold()
                        .scaledFont(name: "Georgia", size: 18)
                        .offset(x: 0, y: 110)
                        .foregroundColor(Color.white)
                    LabelView(text: $text)
                        .frame(width: 230)
                        .offset(x: 0, y: 150)
                    ExitButton(isPresented: $isPresented).offset(x: 120, y: -220)
                }
                
            }
            .offset(x: 0, y: -100)
        }
    }
}

struct TuneDetailView_Previews: PreviewProvider {
    static var tunes: [LooneyTune] = Bundle.main.decode([LooneyTune].self, from: "LooneyTunes.json")
    static var previews: some View {
        TuneDetailView(isPresented: .constant(true), tune: tunes[0], text: tunes[0].description)
    }
}
