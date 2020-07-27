//
//  ContentView.swift
//  LooneyTunes
//
//  Created by Eric Carroll on 7/25/20.
//  Copyright © 2020 Eric Carroll. All rights reserved.
//

import SwiftUI

var index: String = ""

struct ContentView: View {
    @State private var showDetailView = false
    let tunes = LooneyTunes()
    
    let dg = DragGesture()
    
    var filteredTunes: [LooneyTune] {
        var tuneFilter: [LooneyTune]

        tuneFilter = tunes.looneyTunes.filter { $0.name != "Empty"}
        
        let mod = tuneFilter.count % 4
        
        switch mod {
        case 1:
            for _ in 1...3 {
                tuneFilter.append(tunes.looneyTunes[tunes.looneyTunes.endIndex - 1])
            }
        case 2:
            for _ in 1...2 {
                tuneFilter.append(tunes.looneyTunes[tunes.looneyTunes.endIndex - 1])
            }
        case 3:
            tuneFilter.append(tunes.looneyTunes[tunes.looneyTunes.endIndex - 1])
        default:
            break
        }
      
        return tuneFilter
    }
    
    var body: some View {
        NavigationView {
            VStack {
                GridView(rows: filteredTunes.count/4, columns: 4, content: card)
            }
                .navigationBarTitle("World of Mayhem Tunes", displayMode: .inline)
                .sheet(isPresented: $showDetailView) {
                    TuneDetailView(isPresented: self.$showDetailView, tune: self.filteredTunes[self.filteredTunes.firstIndex(where: {$0.name == index}) ?? 0], text: self.filteredTunes[self.filteredTunes.firstIndex(where: {$0.name == index}) ?? 0].description)
                    .highPriorityGesture(self.dg)
                }
        }
    }
    
    func card(atRow row: Int, column: Int) -> some View {
        let index = (row * 4) + column
        let tune = tunes.looneyTunes[index]
        
        return TuneThumb(showDetail: $showDetailView, tune: tune)
        .accessibility(addTraits: .isButton)
        .accessibility(label: Text("Open \(tune.name) Detail"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

