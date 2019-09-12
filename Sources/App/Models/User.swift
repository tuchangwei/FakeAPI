import FluentSQLite
import Vapor

struct User: Content {
    let email: String
    let password: String
}
