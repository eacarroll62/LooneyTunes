//
//  Extensions.swift
//  LooneyTunes
//
//  Created by Eric Carroll on 7/25/20.
//  Copyright © 2020 Eric Carroll. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate, keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        decoder.keyDecodingStrategy = keyDecodingStrategy
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing key '\(key.stringValue)' not found – \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode \(file) from bundle due to type mismatch – \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing \(type) value – \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to decode \(file) from bundle because it appears to be invalid JSON")
        } catch {
            fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)")
        }
    }
}

extension View {
    func debugPrint(_ value: Any) -> some View {
        #if DEBUG
        print(value)
        #endif
        return self
    }
}

@available(iOS 13, macCatalyst 13, tvOS 13, watchOS 6, *)
struct ScaledFont: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory
    var name: String
    var size: CGFloat

    func body(content: Content) -> some View {
       let scaledSize = UIFontMetrics.default.scaledValue(for: size)
        return content.font(.custom(name, size: scaledSize))
    }
}

@available(iOS 13, macCatalyst 13, tvOS 13, watchOS 6, *)
extension View {
    func scaledFont(name: String, size: CGFloat) -> some View {
        return self.modifier(ScaledFont(name: name, size: size))
    }
}

extension Image {
    func asThumbnail(withMaxWidth maxWidth: CGFloat = 100) -> some View {
        resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: maxWidth)
            .overlay(Rectangle()
                .scale(x: 2.8, y: 1.2, anchor: .center)
                .stroke(Color.black, lineWidth: 5)
            ).frame(width: 280, height: 100, alignment: .center)
            .background(Color.lightBlue)
    }
}

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
 
struct TextView: UIViewRepresentable {
    @Binding var text: String
    @Binding var textStyle: UIFont.TextStyle
 
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
 
        textView.font = UIFont.preferredFont(forTextStyle: textStyle)
        textView.autocapitalizationType = .sentences
        textView.isSelectable = true
        textView.isUserInteractionEnabled = true
        
        return textView
    }
 
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
        uiView.font = UIFont.preferredFont(forTextStyle: textStyle)
    }
}

struct LabelView: UIViewRepresentable {
    @Binding var text: String

    func makeUIView(context: Context) -> UILabel {
        let labelView = UILabel()
        
        labelView.numberOfLines = 3
        labelView.preferredMaxLayoutWidth = 100
        
        return labelView
    }
    
    func updateUIView(_ uiView: UILabel, context: Context) {
        let font = UIFont.boldSystemFont(ofSize: 10)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.white,
            .paragraphStyle: paragraphStyle
        ]
        
        uiView.attributedText = NSAttributedString(string: text, attributes: attributes)
    }
}


struct Extensions_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
