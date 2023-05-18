
import Foundation

struct Products: Codable {
    let result: [Product]
}

struct Product: Codable, Hashable {
    let id, mainCategoryID: Int
    let description, typeName, title: String
    let brand: String?
    let model: String
    let image: String
    let variantCount: Int

    enum CodingKeys: String, CodingKey {
        case id
        case mainCategoryID = "main_category_id"
        case description
        case typeName = "type_name"
        case title, brand, model, image
        case variantCount = "variant_count"
    }
}
