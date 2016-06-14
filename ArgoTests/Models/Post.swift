import Argo
import Curry

struct Post {
  let id: Int
  let text: String
  let author: User
  let comments: [Comment]
}

extension Post: Decodable {
  static func decode(_ json: JSON) -> Decoded<Post> {
    return curry(function: self.init)
      <^> json <| "id"
      <*> json <| "text"
      <*> json <| "author"
      <*> json <|| "comments"
  }
}
