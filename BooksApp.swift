//
//  BooksApp.swift
//  Books
//
//  Created by Elizaveta Petrovskaia on 17/03/23.
//

import SwiftUI

@main
struct BooksApp: App {
    @StateObject var bookStore = BookStore()
    
    var body: some Scene {
        WindowGroup {
            BookListView()
                .environmentObject(bookStore)
        }
    }
}
