import SwiftUI
import Foundation

struct SearchView: UIViewRepresentable {
    
    @Binding var textSearched: String
    
    func makeCoordinator() -> SearchView.Coordinator {
        return SearchView.Coordinator.init(parentViewClass: self)
    }
    
    func makeUIView(context: UIViewRepresentableContext<SearchView>) -> UISearchBar {
        let searchView = UISearchBar()
        searchView.searchBarStyle = .default
        searchView.autocapitalizationType = .none
        searchView.delegate = context.coordinator
        return searchView
    }
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchView>) {
        
    }
    
    class Coordinator: NSObject, UISearchBarDelegate {
        var parentView: SearchView!
        init(parentViewClass: SearchView) {
            parentView = parentViewClass
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            parentView.textSearched = searchText
        }
    }
}





















//struct SearchBar: UIViewRepresentable {
//    
//    @Binding var text: String
//    
//    class Coordinator: NSObject, UISearchBarDelegate {
//        @Binding var text: String
//        
//        init(text: Binding<String>) {
//            _text = text
//        }
//        
//        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//            text = searchText
//        }
//    }
//    
//    func makeCoordinator() -> SearchBar.Coordinator {
//        return Coordinator(text: $text)
//    }
//    
//    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
//        let searchBar = UISearchBar(frame: .zero)
//        searchBar.autocapitalizationType = .none
//        searchBar.delegate = context.coordinator
//        return searchBar
//    }
//    
//    func updateUIView(_ uiView: UISearchBar, context: Context) {
//        uiView.text = text
//    }
//}
