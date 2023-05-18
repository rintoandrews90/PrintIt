
import SwiftUI

struct CategoryListView: View {
    
    @StateObject private var viewModel = CategoriesListViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.categories, id: \.self) { category in
                        CategoryRow(category: category)
                    }
                }
            }
        }
        .padding()
        .task {
            await viewModel.getCategories()
        }
    }
}

struct CategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListView()
    }
}
