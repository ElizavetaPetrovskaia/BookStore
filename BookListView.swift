import SwiftUI


struct Book: Identifiable {
    let id = UUID()
    var title: String
    var author: String
}



class BookStore: ObservableObject {
    
    @Published var books: [Book] = [
        Book(title: "To Kill a Mockingbird", author: "Harper Lee"),
        Book(title: "1984", author: "George Orwell"),
        Book(title: "The Catcher in the Rye", author: "J.D. Salinger"),
        Book(title: "One Hundred Years of Solitude", author: "Gabriel Garcia Marquez")
    ]
    
    func delete(at offsets: IndexSet) {
        books.remove(atOffsets: offsets)
    }
    
    func add(book: Book) {
        books.append(book)
    }
    
    func updateBook(id: UUID, with newBook: Book) {
        if let index = books.firstIndex(where: { $0.id == id }) {
            books[index].title = newBook.title
            books[index].author = newBook.author
        }
    }
}


struct BookListView: View {
    @EnvironmentObject var store: BookStore
    @State private var showingAddBookSheet = false
    @State private var selectedBook: Book?
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.books) { book in
                    NavigationLink(destination: BookDetailView(book: book)) {
                        VStack(alignment: .leading) {
                            Text(book.title)
                                .font(.headline)
                                .foregroundColor(.purple)
                            Text(book.author)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .onDelete(perform: store.delete)
            }
            .navigationBarTitle("My books")
            .navigationBarItems(
                trailing: Button(action: { self.showingAddBookSheet.toggle() }) {
                    Image(systemName: "plus")
                }
            )
            .sheet(isPresented: $showingAddBookSheet) {
                AddBookView(store: _store)
            }
        }
    }
}





struct BookListView_Previews: PreviewProvider {
    static var previews: some View {
        BookListView()
            .environmentObject(BookStore())
    }
}
