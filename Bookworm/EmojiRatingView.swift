//
//  EmojiRatingView.swift
//  Bookworm
//
//  Created by 千々岩真吾 on 2025/01/09.
//

import SwiftUI

struct EmojiRatingView: View {
    let rating: Int
    
    var body: some View {
        switch rating {
        case 1:
            Text("😅")
        case 2:
            Text("😀")
        case 3:
            Text("😊")
        case 4:
            Text("😆")
        default:
            Text("😂")
        }
    }
}

#Preview {
    EmojiRatingView(rating: 3)
}
