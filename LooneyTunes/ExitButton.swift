//
//  Index.swift
//  PixelPeople
//
//  Created by Eric Carroll on 6/27/20.
//  Copyright © 2020 Eric Carroll. All rights reserved.
//

import SwiftUI

struct ExitButton: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        Button(action: {
            self.isPresented.toggle()
        }) {
            Image(systemName: "clear.fill")
            .resizable()
            .frame(width: 32, height: 32)
            .background(Color.white)
            .foregroundColor(Color.red)
        }
    }
}

struct ExitButton_Previews: PreviewProvider {
    static var previews: some View {
        ExitButton(isPresented: .constant(true))
    }
}
