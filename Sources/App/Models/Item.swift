import Foundation

class TodoItem {
    var id: String?
    var title: String?
    init(title: String, id: String){
        self.title = title
        self.id = id
    }
    init(){
        self.title = nil
        self.id = nil
    }

    func itemdescription () -> String {
        if let itemID = id, let itemTitle = title {
            return "TodoItem with ID \(itemID) and title \(itemTitle)"
        }
        return "TodoItem contains invalid values"
        
    }
}
