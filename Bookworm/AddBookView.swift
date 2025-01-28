//
//  AddBookView.swift
//  Bookworm
//
//  Created by 千々岩真吾 on 2025/01/09.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = Genre.fantasy
    @State private var review = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(Genre.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                }
                
                Section("Write a review") {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                }
                
                Section {
                    Button("Save") {
                        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating, date: .now)
                        modelContext.insert(newBook)
                        
                        dismiss()
                    }
                }
                .disabled(title.isEmpty || author.isEmpty)
            }
            .navigationTitle("Add Book")
        }
    }
}

#Preview {
    AddBookView()
}
