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
    @Published var token: String? {
        didSet {
            userDefaults.set(token, forKey: UserDefaultsKeys.token)
        }
    }
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
    
    @Published var email: String? {
        didSet {
            userDefaults.set(email, forKey: UserDefaultsKeys.email)
        }
    }
    @Published var collegeID: String? {
        didSet {
            userDefaults.set(collegeID, forKey: UserDefaultsKeys.collegeID)
        }
    }
    @Published var phototype: String? {
        didSet {
            userDefaults.set(phototype, forKey: UserDefaultsKeys.phototype)
        }
    }

    init() {
        self.token = userDefaults.string(forKey: UserDefaultsKeys.token)
        self.uid = userDefaults.integer(forKey: UserDefaultsKeys.uid)
        self.userType = userDefaults.integer(forKey: UserDefaultsKeys.user_type)
        self.isLoggedIn = userDefaults.bool(forKey: UserDefaultsKeys.isLogin)
        self.email = userDefaults.string(forKey: UserDefaultsKeys.email)
        self.collegeID = userDefaults.string(forKey: UserDefaultsKeys.collegeID)
        self.phototype = userDefaults.string(forKey: UserDefaultsKeys.phototype)
    }

    // MARK: - Setters
    func setToken(_ token: String) {
        self.token = token
    }
    
    func setUid(_ uid: Int) {
        self.uid = uid
    }

    func setUserType(_ user_type: Int) {
        self.userType = user_type
    }

    func setIsLoggedIn(_ isLogin: Bool) {
        self.isLoggedIn = isLogin
    }
    func setEmail(_ email: String) {
        self.email = email
    }
    func setCollegeID(_ collegeID: String) {
        self.collegeID = collegeID
    }
    func setPhotoType(_ phototype : String){
        self.phototype = phototype
    }
    

    // MARK: - Getters
    func getToken() -> String?{
        return token
    }
    func getUid() -> Int? {
        return uid
    }

    func getUserType() -> Int {
        return userType
    }

    func getIsLoggedIn() -> Bool {
        return isLoggedIn
    }
    
    func getEmail() -> String?{
        return email
    }
    func getCollegeID() -> String?{
        return collegeID
    }
    func getPhototype() -> String?{
        return phototype
    }
}
