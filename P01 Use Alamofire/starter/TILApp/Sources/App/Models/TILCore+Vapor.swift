/// Copyright (c) 2019 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import Vapor
import FluentSQLite

extension User: SQLiteUUIDModel {}
extension User: Migration {}
extension User: Content {}
extension User: Parameter {}

extension TILCategory: SQLiteModel {}
extension TILCategory: Migration {}
extension TILCategory: Content {}
extension TILCategory: Parameter {}

extension Acronym: SQLiteModel {}
extension Acronym: Migration {
    public static func prepare(on connection: SQLiteConnection) -> Future<Void> {
        return Database.create(self, on: connection) { builder in
            try addProperties(to: builder)
            builder.reference(from: \.userID, to: \User.id)
        }
    }
}
extension Acronym: Content {}
extension Acronym: Parameter {}

extension User {
    var acronyms: Children<User, Acronym> {
        return children(\Acronym.userID)
    }
}

extension TILCategory {
    var acronyms: Siblings<TILCategory, Acronym, AcronymCategoryPivot> {
        return siblings()
    }
}

extension Acronym {
    var user: Parent<Acronym, User> {
        return parent(\.userID)
    }
    
    var categories: Siblings<Acronym, TILCategory, AcronymCategoryPivot> {
        return siblings()
    }
}

