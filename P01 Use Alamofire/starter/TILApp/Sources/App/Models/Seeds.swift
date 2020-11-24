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

import FluentSQLite

struct DefaultUsers: SQLiteMigration {

  static func prepare(on conn: SQLiteConnection) -> EventLoopFuture<Void> {
    let user1 = User(name: "Admin", username: "admin")
    let user2 = User(name: "Tim", username: "timc")
    let user3 = User(name: "Alice", username: "alice")
    let user4 = User(name: "Bob", username: "bob")

    let results = [
      user1.save(on: conn),
      user2.save(on: conn),
      user3.save(on: conn),
      user4.save(on: conn)
    ]

    return results.flatten(on: conn).transform(to: ())
  }

  static func revert(on conn: SQLiteConnection) -> EventLoopFuture<Void> {
    return .done(on: conn)
  }
}

struct DefaultAcronyms: SQLiteMigration {
  static func prepare(on conn: SQLiteConnection) -> EventLoopFuture<Void> {
    return User.query(on: conn).first().flatMap { user in
      guard let userID = user?.id else {
        return conn.future()
      }

      let acronym1 = Acronym(short: "OMG", long: "Oh My God", userID: userID)
      let acronym2 = Acronym(short: "IKR", long: "I Know Right", userID: userID)
      let acronym3 = Acronym(short: "LOL", long: "Laugh Out Loud", userID: userID)
      let acronym4 = Acronym(short: "IRL", long: "In Real Life", userID: userID)

      let results = [
        acronym1.save(on: conn),
        acronym2.save(on: conn),
        acronym3.save(on: conn),
        acronym4.save(on: conn)
      ]

      return results.flatten(on: conn).transform(to: ())
    }
  }

  static func revert(on conn: SQLiteConnection) -> EventLoopFuture<Void> {
    return .done(on: conn)
  }
}

struct DefaultCategories: SQLiteMigration {
  static func prepare(on conn: SQLiteConnection) -> EventLoopFuture<Void> {
    let category1 = TILCategory(name: "Funny")
    let category2 = TILCategory(name: "Teenager")
    let results = [
      category1.save(on: conn),
      category2.save(on: conn)
    ]
    return results.flatten(on: conn).flatMap { categories in
      return Acronym.query(on: conn).first().flatMap { acronym in
        guard let acronym = acronym, let category = categories.first else {
          return conn.future()
        }
        guard let relationship = try? AcronymCategoryPivot(acronym, category) else {
          return conn.future()
        }
        return relationship.save(on: conn).transform(to: ())
      }
    }
  }

  static func revert(on conn: SQLiteConnection) -> EventLoopFuture<Void> {
    return .done(on: conn)
  }
}
