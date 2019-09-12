import Vapor

/// Controls basic CRUD operations on `Todo`s.
final class LoginController: RouteCollection {
    func boot(router: Router) throws {
        let loginRouter = router.grouped("api", "login")
        loginRouter.post { request -> Future<HTTPStatus> in
            return try request.content.decode(User.self)
                .map(to: HTTPStatus.self) { user in
                    print("\(user.email), \(user.password)")
                    if user.email == "1@1.com" && user.password == "123456" {
                        return .ok
                    } else {
                        return .notAcceptable
                    }
            }
        }
    }
}
