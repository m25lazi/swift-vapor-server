import Vapor

let drop = Droplet()

drop.get("hello") { request in
    return "Hello, world!"
}

drop.get("item") { request in
    let a = TodoItem.init(title: "abc", id:"N686nJ")
    return a.itemdescription()//"Hello, world!"
}

drop.get("itemnil") { request in
    let a = TodoItem.init()
    return a.itemdescription()//"Hello, world!"
}

drop.get("users", Int.self) { request, userId in
    return "You requested User #\(userId)"
}

drop.get("admins", ":id") { request in
    guard let adminId = request.parameters["id"]?.int else {
        throw Abort.badRequest
    }

    return "You requested Admin #\(adminId)"
}

drop.get { req in
    let lang = req.headers["Accept-Language"]?.string ?? "en"
    return try drop.view.make("welcome", [
    	"message": Node.string(drop.localization[lang, "welcome", "title"])
    ])
}

drop.resource("posts", PostController())

drop.run()
