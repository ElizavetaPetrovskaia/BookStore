//
//  AddBookView.swift
//  Books
//
//  Created by Elizaveta Petrovskaia on 24/03/23.
//

import SwiftUI
struct AddBookView: View {
    @EnvironmentObject var store: BookStore
    @State private var title = ""
    @State private var author = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Title", text: $title)
                    TextField("Author", text: $author)
                }
                
                Section {
                    Button("Add Book") {
                        guard !title.isEmpty && !author.isEmpty else {
                            return // show an error message or do nothing
                        }
                        
                        let newBook = Book(title: title, author: author)
                        store.add(book: newBook)
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .navigationBarTitle("Add Book")
        }
    }
}


struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
            .environmentObject(BookStore())
    }
}

