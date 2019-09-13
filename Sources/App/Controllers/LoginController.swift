import Vapor

/// Controls basic CRUD operations on `Todo`s.
final class LoginController: RouteCollection {
    struct LoginParams: Content {
        let email: String
        let password: String
    }
    struct LoginResult: Content {
        let token: String?
        let error: String?
    }
    func boot(router: Router) throws {
        let loginRouter = router.grouped("api", "login")
        loginRouter.post { request -> Future<Response> in
            return try request.content.decode(LoginParams.self).flatMap({ user in
                if user.email == "1@1.com" && user.password == "123456" {
                    return LoginResult(token: String(Date().timeIntervalSince1970), error: nil )
                        .encode(status: .ok, for: request)
                } else {
                    return LoginResult(token: nil, error: "Email or Password is incorrect" )
                        .encode(status: .unauthorized, for: request)
                }
                
            })
        }
    }
}
