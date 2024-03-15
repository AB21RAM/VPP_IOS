//
//  ParentMainScreen.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 12/03/24.
//

import SwiftUI

struct ParentMainScreen: View {
    //    yyyy-MM-dd --> Date Format
    // need to review that whether that list of Attendace get Attched to the view -> UUID()
    @StateObject var pViewModel : ParentMainViewModel = ParentMainViewModel()
    @StateObject var sViewModel : StudentProfileViewModel = StudentProfileViewModel()
    @StateObject var viewmodel = StudentProfileViewModel()
    @State private var dynamicContent: Int = 1
    let userDefaultsManager = UserDefaultsManager.shared
    var facultyList : [HODFacultyLeavesList] = [HODFacultyLeavesList( facultyName: "", alternateName: "", leaveAppID: 0, leaveID: 0, no_of_days: 1.0, fromDate: "", toDate: "", reason: "", facultyID: 0)]
    var body: some View {
        
        
            
            NavigationStack{
                GeometryReader { geometry in
                    ZStack{
                        VStack(spacing: 5){
                            //                    (spacing: 0)
                            VStack{
                                HStack{
                                    Text("Profile")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.title)
                                    Button(
                                        action: {
                                            // do something
                                            userDefaultsManager.setIsLoggedIn(false)
                                            UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.collegeID)
                                        },
                                        label: {
                                            VStack{
                                                Image(systemName: "rectangle.portrait.and.arrow.right")
                                                    .foregroundColor(.white)
                                                Text("Logout")
                                                    .font(.caption)
                                            }
                                           
                                        }
                                    )
                                }
                                
                            }
                            .foregroundStyle(Color.white)
                            .padding(.bottom,100)
                            .padding(20)
                            .frame(width: geometry.size.width, height: geometry.size.height * 2 / 12)
                            .background(Color("toolbar"))
                            VStack{
                                VStack{
                                    HStack {
                                        Text("From date")
                                            .padding(10)
                                            .background(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color("toolbar"))
                                            )
//                                            .frame(maxWidth: .infinity,alignment: .leading)
                                        Button(action: {}, label: {
                                            Image(systemName: "calendar")
                                                .foregroundStyle(Color.white)
                                                .padding(10)
                                                .background(
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .fill(Color.blue)
                                                )
                                        })
                                        Text("To date")
                                            .padding(10)
                                            .background(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color("toolbar"))
                                            )
                                        Button(action: {}, label: {
                                            Image(systemName: "calendar")
                                                .foregroundStyle(Color.white)
                                                .padding(10)
                                                .background(
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .fill(Color.blue)
                                                )
                                        })
                                    }
                                    .frame(maxWidth: .infinity)
                                    Button(action: {}, label: {
                                        Text("Fetch")
                                            
                                            .frame(maxWidth: .infinity)
    
                                            .foregroundStyle(Color.white)
                                            .padding(10)
                                            .background(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .fill(Color.indigo)
                                            )
                                            
                                    })
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
//                                    .frame(maxWidth: .infinity)
                                }.padding(.top,70)
                            }
                            .frame(width: geometry.size.width, height: geometry.size.height * 3 / 12)
                            .background(Color("background"))
                            ScrollView{
                                LazyVStack(alignment: .center, content: {
                                    ForEach(facultyList) { count in
                                        HStack{
                                            VStack{
                                                Text("Student ID ")
                                                    .font(.headline)
                                                    .frame(maxWidth: .infinity,alignment: .leading)
                                                Text("Name")
                                                    .bold()
                                                    .font(.title2)
                                                    .multilineTextAlignment(.leading)
                                                    .frame(maxWidth: .infinity,alignment: .leading)
                                                Text("Department ")
                                                    .font(.headline)
                                                    .frame(maxWidth: .infinity,alignment: .leading)
                                            }
                                            
                                            .frame(maxWidth: .infinity,alignment: .leading)
                                            
                                            Button(action: {
                    //                                        guard let url = URL(string: "tel://\(phoneNumber)") else { return }
                    //                                        UIApplication.shared.open(url)
                                                        }) {
                                                            Image(systemName: "phone")
                                                                .frame(width: 100, height: 100)
                                                                .frame(alignment: .center)
                                                        }
                                        }
                                        .modifier(CardModifier(paddingValue: 15, backgroundColor: Color(.white), cornerRadius: 10, foregroundColor: Color("toolbar"), font: .title2))
                                        .shadow(radius: 5)
                                        
                                    }
                                })
                            }
                            .scrollIndicators(.hidden)
                            .frame(width: geometry.size.width, height: geometry.size.height * 7 / 12)
                            .background(Color("background"))
                        }
                        
                    }
                    HStack{
                        if let imageURL = URL(string: viewmodel.profileDataModel.photo) {
                            AsyncImage(url: imageURL) { phase in
                                if let image = phase.image {
                                    // Display the loaded image
                                    image
                                        .resizable()
                                        .frame(width: 110, height: 120)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .shadow(radius: 10)
                                        .aspectRatio(contentMode: .fit)
                                } else if phase.error != nil {
                                    // Display a placeholder when loading failed
                                    Image(systemName: "person.crop.rectangle.stack")
                                        .resizable()
                                        .frame(width: 110, height: 120)
                                        .shadow(radius: 10)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .aspectRatio(contentMode: .fit)
                                } else {
                                    // Display a placeholder while loading
                                    ProgressView()
                                        .frame(width: 110, height: 120)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .aspectRatio(contentMode: .fit)
                                }
                            }
                            .padding(.trailing, 10)
                        } else {
                            // Display placeholder when URL string is empty
                            Image(systemName: "person.crop.rectangle.stack")
                                .resizable()
                                .frame(width: 110, height: 120)
                                .shadow(radius: 10)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .aspectRatio(contentMode: .fit)
                                .padding(.trailing, 10)
                        }

                        VStack{
                            Text(viewmodel.profileDataModel.Name)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.headline)
    //                            .font(.custom("new", fixedSize: 20))
                                .bold()
                            Text(viewmodel.profileDataModel.idNo)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.headline)
                            Text(viewmodel.profileDataModel.year)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.headline)
                                .bold()
                            Text(userDefaultsManager.getEmail() ?? "")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.caption2)
                        }
                        .foregroundStyle(Color("toolbar"))
                        .frame(maxWidth: .infinity, alignment: .leading)
    //                    .background(.blue)
                    }
                    .modifier(CardModifier(paddingValue: 15, backgroundColor: Color(.white), cornerRadius: 10, foregroundColor: Color("toolbar"), font: .title3))
                    .frame(maxWidth: .infinity, alignment: .leading)
    //                .frame(width: 390,height: 200)
                    .shadow(radius: 5)
                    .padding(.top,30)
                    .task {
                        // Load data only when the view appears for the first time
                        if !viewmodel.isDataLoaded {
                            
                            viewmodel.getProfileData()
                            // Set the flag to indicate that data has been loaded
                            viewmodel.isDataLoaded = true
    //                        userDefaultsManager.setCollegeID(viewmodel.homeDataModel.idNo)
                        }
                    }
                }
            }
        }
        /*
        ScrollView{
            LazyVStack(alignment: .center, content: {
                ForEach(facultyList) { count in
                    HStack{
                        VStack{
                            Text("Student ID ")
                                .font(.headline)
                                .frame(maxWidth: .infinity,alignment: .leading)
                            Text("Name")
                                .bold()
                                .font(.title2)
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: .infinity,alignment: .leading)
                            Text("Department ")
                                .font(.headline)
                                .frame(maxWidth: .infinity,alignment: .leading)
                        }
                        
                        .frame(maxWidth: .infinity,alignment: .leading)
                        
                        Button(action: {
//                                        guard let url = URL(string: "tel://\(phoneNumber)") else { return }
//                                        UIApplication.shared.open(url)
                                    }) {
                                        Image(systemName: "phone")
                                            .frame(width: 100, height: 100)
                                            .frame(alignment: .center)
                                    }
                    }
                    .modifier(CardModifier(paddingValue: 15, backgroundColor: Color(.white), cornerRadius: 10, foregroundColor: Color("toolbar"), font: .title2))
                    .shadow(radius: 5)
                    
                }
            })
        }
         */
    }
         


#Preview {
    ParentMainScreen()
}
