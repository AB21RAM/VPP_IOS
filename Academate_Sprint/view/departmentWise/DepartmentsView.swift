//
//  DepartmentsView.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 21/01/24.
//

import LottieUI
import SwiftUI
import SlidingTabView

struct DepartmentsView: View {
    @State private var selectedTabIndex = 0
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var departmentViewModel = DepartMentViewModel()
    var body: some View {
        VStack{
            if departmentViewModel.countDataModel.isPlaying{
                LottieView("newLoading")
                    .play(departmentViewModel.countDataModel.isPlaying)
            }else{
                TabView {
                    DepartmentWiseView(departmentName: "Computer" ,
                                       departmentTotalCount: departmentViewModel.countDataModel.COMPS,
                                       departmentPendingCount:
                                        String((Int(departmentViewModel.countDataModel.COMPS) ?? 0)-(Int(departmentViewModel.countDataModel.pCOMPS) ?? 0)),
                                       branch: 1 ,
                                       branch_name: "Computer Engineering")
                    
                    DepartmentWiseView(departmentName: "AIDS" ,
                                       departmentTotalCount: departmentViewModel.countDataModel.AIDS,
                                       departmentPendingCount: String((Int(departmentViewModel.countDataModel.AIDS) ?? 0)-(Int(departmentViewModel.countDataModel.pAIDS) ?? 0)),
                                       branch: 2 ,
                                       branch_name: "Artificial Intelligence and Data Science")
                    
                    DepartmentWiseView(departmentName: "EXTC" ,
                                       departmentTotalCount: departmentViewModel.countDataModel.EXTC,
                                       departmentPendingCount: String((Int(departmentViewModel.countDataModel.EXTC) ?? 0)-(Int(departmentViewModel.countDataModel.pEXTC) ?? 0)),
                                       branch: 3 ,
                                       branch_name: "Electronics and Telecommunication Engineering")
                    DepartmentWiseView(departmentName: "IT" ,
                                       departmentTotalCount: departmentViewModel.countDataModel.IT,
                                       departmentPendingCount: String((Int(departmentViewModel.countDataModel.IT) ?? 0)-(Int(departmentViewModel.countDataModel.pIT) ?? 0)),
                                       branch: 4 ,
                                       branch_name: "Information Technology")
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: CustomBackButton(action: {
                    // Handle back button action
                    self.presentationMode.wrappedValue.dismiss()
                }, button_color: Color.white))
                .toolbar(content: {
                    ToolbarItem(placement: .principal) {
                        Text("Departments")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                })
                .toolbarBackground(
                    Color(UIColor(hex:0x160747, alpha: 1.0)),
                    for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
            }
            
           
        }.background(Color(UIColor(hex:0xEEEAF4, alpha: 1.0)))
        //                .padding(.top, 10)
        
        
    }
    
    struct DepartmentsView_Previews: PreviewProvider {
        static var previews: some View {
            DepartmentsView()
        }
    }
}

/*
 SlidingTabView(
 selection: self.$selectedTabIndex,
 tabs: ["COMPS", "AIDS","EXTC","IT"])
 Spacer()
 if selectedTabIndex == 0{
 
 DepartmentWiseView(departmentName: "Computer" , departmentTotalCount: "10", departmentPendingCount: "10",branch: 1 , branch_name: "Computer Engineering")
 
 } else if selectedTabIndex == 1{
 
 DepartmentWiseView(departmentName: "AIDS" , departmentTotalCount: "10", departmentPendingCount: "10",branch: 2 , branch_name: "Computer Engineering")
 
 }else if selectedTabIndex == 2{
 
 DepartmentWiseView(departmentName: "EXTC" , departmentTotalCount: "10", departmentPendingCount: "10",branch: 3 , branch_name: "Computer Engineering")
 
 }else if selectedTabIndex == 3{
 
 DepartmentWiseView(departmentName: "IT" , departmentTotalCount: "10", departmentPendingCount: "10",branch: 4 , branch_name: "Computer Engineering")
 }
 }.animation(.spring(), value: selectedTabIndex)
 */
