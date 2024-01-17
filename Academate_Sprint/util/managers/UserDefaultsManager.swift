//
//  UserDefaultsManager.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 15/01/24.
//

import Foundation
import Combine

class UserDefaultsManager: ObservableObject {
    static let shared = UserDefaultsManager()

    private let userDefaults = UserDefaults.standard

    // MARK: - Published Properties
    @Published var uid: Int? {
        didSet {
            userDefaults.set(uid, forKey: UserDefaultsKeys.uid)
        }
    }

    @Published var userType: Int {
        didSet {
            userDefaults.set(userType, forKey: UserDefaultsKeys.user_type)
        }
    }

    @Published var isLoggedIn: Bool {
        didSet {
            userDefaults.set(isLoggedIn, forKey: UserDefaultsKeys.isLogin)
        }
    }

    init() {
        self.uid = userDefaults.integer(forKey: UserDefaultsKeys.uid)
        self.userType = userDefaults.integer(forKey: UserDefaultsKeys.user_type)
        self.isLoggedIn = userDefaults.bool(forKey: UserDefaultsKeys.isLogin)
    }

    // MARK: - Setters
    func setUid(_ uid: Int) {
        self.uid = uid
    }

    func setUserType(_ user_type: Int) {
        self.userType = user_type
    }

    func setIsLoggedIn(_ isLogin: Bool) {
        self.isLoggedIn = isLogin
    }

    // MARK: - Getters
    func getUid() -> Int? {
        return uid
    }

    func getUserType() -> Int {
        return userType
    }

    func getIsLoggedIn() -> Bool {
        return isLoggedIn
    }
}
