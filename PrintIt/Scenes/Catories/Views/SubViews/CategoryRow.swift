
import SwiftUI

struct CategoryRow: View {
    
    let category: Category
    @State private var isActive = false
    
    var body: some View {
        VStack {
            HStack {
                AsyncImage(url: URL(string: category.imageURL)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 100, maxHeight: 100)
                            .cornerRadius(5)
                    case .failure:
                        Image(systemName: "photo")
                    @unknown default:
                        EmptyView()
                    }
                }
                
                VStack(alignment: .leading) {
                    Text(category.title)
                        .padding(.bottom, 5)
                        .font(.headline)
                        .foregroundColor(.black)
                    Text(" Size: \(category.size.rawValue.capitalized)")
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            Divider()
        }
        .onTapGesture {
            self.isActive = true
        }
        .background(
            NavigationLink (
                destination: ProductsListView(category: category), isActive: $isActive,
                label: {
                    EmptyView()
                }
            ))
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(category: Category(id: 1, parentID: 1, imageURL: "www.test.com", catalogPosition: 1, size: .small, title: "Sample"))
    }
}
