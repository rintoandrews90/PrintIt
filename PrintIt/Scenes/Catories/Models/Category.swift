
import Foundation

struct CateoryList: Codable {
    let code: Int
    let result: Categories
}

struct Categories: Codable {
    let categories: [Category]
}

struct Category: Codable, Hashable {
    let id, parentID: Int
    let imageURL: String
    let catalogPosition: Int
    let size: Size
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case parentID = "parent_id"
        case imageURL = "image_url"
        case catalogPosition = "catalog_position"
        case size, title
    }
}

enum Size: String, Codable {
    case small = "small"
}
