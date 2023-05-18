
import SwiftUI

struct ProductsListView: View {
    
    let category: Category
    @StateObject private var viewModel: ProductsListViewModel
    
    init(category: Category) {
        self.category = category
        _viewModel = StateObject(wrappedValue: ProductsListViewModel(category: category))
    }
    
    var body: some View {
        switch viewModel.state {
        case .loading:
            ProgressView()
        case .idle:
            Color.clear
                .task {
                    await viewModel.getProducts()
                }
        case .failed(let error):
            Text(error.localizedDescription)
        case .loaded:
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.products, id: \.self) { product in
                        NavigationLink {
                            ProductDetailView(product: product)
                        } label: {
                            ProductRow(product: product)
                        }
                    }
                }
            }
        }
    }
}

struct ProductsListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsListView(category: Category(id: 1, parentID: 1, imageURL: "www.test.com", catalogPosition: 1, size: .small, title: "Test"))
    }
}
