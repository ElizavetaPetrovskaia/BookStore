# BookStore
This project is an example of how to use SwiftUI to create a simple book list app. The app displays a list of books with their titles and authors, and allows the user to add, delete, and update books.
The app uses a model class called Book that conforms to the Identifiable protocol, and a store class called BookStore that conforms to the ObservableObject protocol. The BookStore class has an array of Book objects as a property, and provides methods for adding, deleting, and updating books.

The main view of the app is called BookListView, which is a NavigationView that displays a list of books using a List view. Each book in the list is a NavigationLink that takes the user to a detailed view of the book when tapped. The BookListView also has a button on the top right corner that allows the user to add a new book.

The app also has a preview struct called BookListView_Previews that shows how the app looks like in Xcode's preview pane.

Overall, this project is a great example of how to use SwiftUI and the MVVM architecture to create a simple yet functional app.
