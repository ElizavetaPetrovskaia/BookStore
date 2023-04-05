//
//  NewBookView.swift
//  Books
//
//  Created by Elizaveta Petrovskaia on 24/03/23.
//

import SwiftUI

struct NewBookView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var store: BookStore
    
    @State private var title = ""
    @State private var author = ""
    
    var body: some View {
        Form {
            TextField("Title", text: $title)
            TextField("Author", text: $author)
        }
        .navigationBarTitle("New Book")
        .navigationBarItems(
            trailing: Button(action: {
                self.store.books.append(Book(title: self.title, author: self.author))
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Save")
            })
            .disabled(title.isEmpty || author.isEmpty)
        )
    }
}

struct NewBookView_Previews: PreviewProvider {
    static var previews: some View {
        NewBookView(store: BookStore())
    }
}
