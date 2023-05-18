
import SwiftUI

struct CategoryListView: View {
    
    @StateObject private var viewModel = CategoriesListViewModel()
    
    var body: some View {
        
        switch viewModel.state {
        case .loading:
            ProgressView()
        case .idle:
            Color.clear
                .task {
                    await viewModel.getCategories()
                }
        case .failed(let error):
            Text(error.localizedDescription)
        case .loaded:
            NavigationView {
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.categories, id: \.self) { category in
                            NavigationLink {
                                ProductsListView(category: category)
                            } label: {
                                CategoryRow(category: category)
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}

struct CategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListView()
    }
}
