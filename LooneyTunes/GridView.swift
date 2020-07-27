//
//  GridView.swift
//  LooneyTunes
//
//  Created by Eric Carroll on 7/25/20.
//  Copyright © 2020 Eric Carroll. All rights reserved.
//

import SwiftUI

struct GridView<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content

    var body: some View {
        VStack {
            ForEach(0 ..< rows, id: \.self) { row in
                HStack {
                    ForEach(0 ..< self.columns, id: \.self) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }

    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(rows: 4, columns: 4) {row,col in
            Image(systemName: "bell.circle.fill")
        }
    }
}

