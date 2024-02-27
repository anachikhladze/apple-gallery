//
//  MockAPI.swift
//  apple-gallery
//
//  Created by Anna Sumire on 27.02.24.
//

import Foundation

final class MockAPI {
    
    private var registeredUsers = [
        User(id: UUID(), email: "anachikhladze@gmail.com", age: "25", password: "qwerty")
    ]
    
    static let shared = MockAPI()
    
    private init() {}
    
    func login(email: String, password: String) async throws -> Void {
        
        guard let user = registeredUsers.first(where: { $0.email == email }) else {
            throw UserError.userNotFound
        }
        
        guard user.password == password else {
            throw UserError.incorrectPassword
        }
    }
    
    func register(email: String, password: String, age: String) async throws -> Void {
        
        if registeredUsers.contains(where: { $0.email == email }) {
            throw UserError.emailAlreadyInUse
        }
        
        let user = User(id: UUID(), email: email, age: age, password: password)
        registeredUsers.append(user)
    }

}

enum UserError: Error {
    case userNotFound
    case incorrectPassword
    case emailAlreadyInUse
}
