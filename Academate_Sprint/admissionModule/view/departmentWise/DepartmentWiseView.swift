//
//  DepartmentWiseView.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 17/01/24.
//

import Foundation
import SwiftUI

struct DepartmentWiseView: View {
    
    var departmentName : String
    var departmentTotalCount : String
    var departmentPendingCount : String
    var branch: Int
    var branch_name: String
    @State private var showAlert = false
    @State private var isShowingDetailView = false
    var body: some View {
        
        ScrollView{
            VStack(spacing: 1){
                
                VStack(alignment: .leading) {
                    Text("\(departmentName) Department Total Applications: ")
                        .font(.largeTitle)
                        .frame(alignment: .leading)
                    //                    .padding(.bottom)
                    Text("\(departmentTotalCount)")
                        .font(.largeTitle)
                        .bold()
                    // MARK : To  do Implement the CSV Download
                }.modifier(CardModifier(paddingValue: 10, backgroundColor: Color(UIColor(hex:0xFAFAFA, alpha: 1.0)), cornerRadius: 15, foregroundColor: Color.black, font: Font.body))
                
                
                VStack(alignment: .leading){
                    Text("\(departmentName) Department Pending Applications:")
                        .font(.largeTitle)
                    HStack{
                        Text("\(departmentPendingCount)")
                            .font(.largeTitle)
                            .bold()
                        Spacer()
                        NavigationLink(destination: PendingCSVView(branch: branch)){
                            
                            Image(systemName:"doc.circle").resizable().scaledToFit().frame(width: 45, height: 45).padding(4).background().cornerRadius(12)
                            
                        }
                        
                    }
                }.modifier(CardModifier(paddingValue: 10, backgroundColor: Color(UIColor(hex:0xFAFAFA, alpha: 1.0)), cornerRadius: 15, foregroundColor: Color.black, font: Font.body))
                //--------------------------------------------------
                Divider().background(Color.black).padding(.bottom,10)
                Text("View Applications")
                    .font(.title)
                    .padding(10)
                    .background(Color(UIColor(hex:0xFAFAFA, alpha: 1.0)))
                    .cornerRadius(10)
                HStack(spacing: 1){
                    NavigationLink(destination: BranchYearCSVView(year: 1, branch: branch_name)){
                        HStack(alignment: .center){
                            Text("1")
                            + Text("st ")
                                .font(.system(size: 13.0))
                                .baselineOffset(10.0)
                            + Text("Year")
                            Image(systemName:"doc.circle").resizable().scaledToFit().frame(width: 35, height: 35).cornerRadius(12)
                                .foregroundColor(Color.white)
                        }
                        .modifier(CardModifier(paddingValue: 9, backgroundColor: Color(UIColor(hex:0x647AFF, alpha: 1.0)), cornerRadius: 15, foregroundColor: Color.white, font: Font.title2))
                    }
                    NavigationLink(destination: BranchYearCSVView(year: 3, branch: branch_name)){
                                HStack(alignment: .center){
                                    Text("2")
                                    + Text("nd ")
                                        .font(.system(size: 13.0))
                                        .baselineOffset(10.0)
                                    + Text("Year")
                                    Image(systemName:"doc.circle").resizable().scaledToFit().frame(width: 35, height: 35).cornerRadius(12)
                                        .foregroundColor(Color.white)
                                }
                        .modifier(CardModifier(paddingValue: 9, backgroundColor: Color(UIColor(hex:0x647AFF, alpha: 1.0)), cornerRadius: 15, foregroundColor: Color.white, font: Font.title2))
                    }
                }
                
                HStack(spacing: 1){
                    NavigationLink(destination: BranchYearCSVView(year: 4, branch: branch_name)){
                                HStack(alignment: .center){
                                    Text("3")
                                    + Text("rd ")
                                        .font(.system(size: 13.0))
                                        .baselineOffset(10.0)
                                    + Text("Year")
                                    Image(systemName:"doc.circle").resizable().scaledToFit().frame(width: 35, height: 35).cornerRadius(12)
                                        .foregroundColor(Color.white)
                                }
                        .modifier(CardModifier(paddingValue: 9, backgroundColor: Color(UIColor(hex:0x647AFF, alpha: 1.0)), cornerRadius: 15, foregroundColor: Color.white, font: Font.title2))
                    }
                    
                    NavigationLink(destination: BranchYearCSVView(year: 5, branch: branch_name)){
                                HStack(alignment: .center){
                                    Text("4")
                                    + Text("th ")
                                        .font(.system(size: 13.0))
                                        .baselineOffset(10.0)
                                    + Text("Year")
                                    Image(systemName:"doc.circle").resizable().scaledToFit().frame(width: 35, height: 35).cornerRadius(12)
                                        .foregroundColor(Color.white)
                                }
                        .modifier(CardModifier(paddingValue: 9, backgroundColor: Color(UIColor(hex:0x647AFF, alpha: 1.0)), cornerRadius: 15, foregroundColor: Color.white, font: Font.title2))
                    }
                }
                NavigationLink(destination: BranchYearCSVView(year: 2, branch: branch_name)){
                            HStack(alignment: .center){
                                Text("Direct Second Year")
                                Image(systemName:"doc.circle").resizable().scaledToFit().frame(width: 35, height: 35).cornerRadius(12)
                                    .foregroundColor(Color.white)
                            }
                    .modifier(CardModifier(paddingValue: 9, backgroundColor: Color(UIColor(hex:0x647AFF, alpha: 1.0)), cornerRadius: 15, foregroundColor: Color.white, font: Font.title2))
                }
                NavigationLink(destination: BranchCSVView( branch: branch_name)){
                            HStack(alignment: .center){
                                Text("View All \(departmentName) Applications")
                                Image(systemName:"doc.circle").resizable().scaledToFit().frame(width: 35, height: 35).cornerRadius(12)
                                    .foregroundColor(Color.white)
                            }
                    .modifier(CardModifier(paddingValue: 9, backgroundColor: Color(UIColor(hex:0x647AFF, alpha: 1.0)), cornerRadius: 15, foregroundColor: Color.white, font: Font.title2))
                }
            }
        }
    }
    // Backup Option if any thing Went Wrong 
//    func BrozwerLink(brach : String , year : Int){
//        Link("Info", destination: URL(string: "https://vppcoe-va.getflytechnologies.com/api/admission/pendingAppD?brach=1")!)
//    }
}


struct DepartmentWiseView_Previews: PreviewProvider {
    static var previews: some View {
        DepartmentWiseView(departmentName: String("Computer"), departmentTotalCount: String("200"), departmentPendingCount: String(100),branch: 1 , branch_name: "COmputer ENgg")
    }
}


