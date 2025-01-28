//
//  DetailView.swift
//  Bookworm
//
//  Created by 千々岩真吾 on 2025/01/10.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    
    let book: Book
    
    func deleteBook() {
        modelContext.delete(book)
        dismiss()
    }
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre.rawValue)
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre.rawValue.uppercased())
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundStyle(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(.capsule)
                    .offset(x: -5, y: -5)
            }
            
            Text(book.author)
                .font(.title)
                .foregroundStyle(.secondary)
            
            Text(book.date.formatted(date: .abbreviated, time: .omitted))
            
            Text(book.review)
                .padding()
            
            RatingView(rating: .constant(book.rating))
                .font(.largeTitle)
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert("Delete this book", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Are you sure?")
        }
        .toolbar {
            Button("Delete this book", systemImage: "trash") {
                showingDeleteAlert = true
            }
        }
        
    }
}

#Preview {
    NavigationStack {
        DetailView(book: Book(title: "Test Book", author: "Test Author", genre: Genre.fantasy, review: "This book is awesome.", rating: 5, date: .now))
            .modelContainer(for: Book.self, inMemory: true)
    }
}
