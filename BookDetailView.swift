import SwiftUI

struct BookDetailView: View {
    @EnvironmentObject var store: BookStore
    var book: Book

    @State private var title: String
    @State private var author: String
    @State private var isEditable = false

    init(book: Book) {
        self.book = book
        _title = State(initialValue: book.title)
        _author = State(initialValue: book.author)
    }

    var body: some View {
        Form {
            Section {
                TextField("Title", text: $title)
                    .padding(.horizontal)
                    //.textFieldStyle(RoundedBorderTextFieldStyle())
                    .disabled(!isEditable)
            } header: {
                Text("Book Name")
            }

           
            Section {
            TextField("Author", text: $author)
                .padding(.horizontal)
               // .textFieldStyle(RoundedBorderTextFieldStyle())
                .disabled(!isEditable)
            } header: {
                Text("Book Author")
            }

           
        }
        .navigationBarTitle(Text(title), displayMode: .inline)
        .navigationBarItems(
            leading: Group {
                if isEditable {
                    Button(action: {
                        self.isEditable = false
                        self.title = book.title
                        self.author = book.author
                    }, label: {
                        Text("Cancel")
                    })
                    .padding(.leading)
                }
            },
            trailing: Group {
                if isEditable {
                    Button(action: {
                        let updatedBook = Book(title: title, author: author)
                        store.updateBook(id: book.id, with: updatedBook)
                        self.isEditable = false
                    }, label: {
                        Text("Save")
                    })
                    .padding(.trailing)
                } else {
                    Button(action: {
                        self.isEditable = true
                    }, label: {
                        Text("Edit")
                    })
                    .padding(.trailing)
                }
            }
           
        )
    }
}


struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            let book = Book(title: "To Kill a Mockingbird", author: "Harper Lee")
            BookDetailView(book: book)
                .environmentObject(BookStore())
        }
    }
}

