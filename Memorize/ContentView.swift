//
//  ContentView.swift
//  Memorize
//
//  Created by arogya.Gurkha on 10/15/23.
//

import SwiftUI

struct ContentView: View {
    let defaultEmojis = ["💀", "🥲", "🙃", "🍫", "🙏", "🥵", "😎", "🥸", "👹", "👺", "🫳", "🫥"]
    let vehicleEmojis = ["⛴️", "🚃", "🛺", "✈️", "🚲", "🚜", "🚟", "🚋", "🚂", "🚀", "🚁", "🚛"]
    let foodEmojis = ["🌭", "🍒", "🥠", "🍦", "🥦", "🍇", "🫚", "🦐", "🥨", "🧇", "🥜", "🍠"]
    @State var emojis: [String] = ["💀", "🥲", "🙃", "🍫", "🙏", "🥵", "😎", "🥸", "👹", "👺", "🫳", "🫥"]
    @State var cardCount = 4
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            themeSelector
        }
        .padding()
    }
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self ) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundStyle(.orange)
    }
    var cardAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
    }
    func cardCountAdjusters(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    var cardRemover: some View {
        cardCountAdjusters(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    var cardAdder: some View {
        cardCountAdjusters(by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }
    var themeSelector: some View {
        HStack {
            emojiThemeSelector.padding()
            vehicleThemeSelector.padding()
            foodThemeSelector.padding()
        }
        .imageScale(.large)
    }
    func themeChangers(theme: [String], symbol: String, text: String) -> some View {
        VStack {
            Button(action: {
                emojis = theme.shuffled()
            }, label: {
                Image(systemName: symbol)
            })
            Text(text)
        }
    }
    var emojiThemeSelector: some View {
        themeChangers(theme: defaultEmojis, symbol: "house", text: "Emoji")
    }
    var vehicleThemeSelector: some View {
        themeChangers(theme: vehicleEmojis, symbol: "car", text: "Vehicle")
    }
    var foodThemeSelector: some View {
        themeChangers(theme: foodEmojis, symbol: "fork.knife", text: "Food")
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false

    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
