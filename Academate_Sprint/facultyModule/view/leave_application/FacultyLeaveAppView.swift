//
//  FacultyLeaveAppView.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 05/03/24.
//

import SwiftUI
// picker selection error // validation for it 
struct FacultyLeaveAppView: View {
    @StateObject var viewmodel = FacultyLeaveApplicationViewModel()
    
//    let dummyList: [LeaveType] = [
//        LeaveType(leave_id: 1, lname: "Annual Leave"),
//        LeaveType(leave_id: 2, lname: "Sick Leave"),
//        LeaveType(leave_id: 3, lname: "Maternity Leave"),
//        LeaveType(leave_id: 4, lname: "Paternity Leave")
//    ]
    @State var isLeaveSelected : Bool = false
    @State var isAlternateSelected : Bool = false
    @State var isNaviGateComplete : Bool = false
    @State var dummyList: [LeaveType] = [LeaveType(leave_id: 1, lname: "")]
    @State var alternateList: [FacultyNew] = [FacultyNew(faculty_id: 1, name: "")]
    // take the list of mames first from the api then compare that selected name from the complete list coming from the api to get the id
    @State var dummyLeaveListName = ["Annual Leave","Sick Leave","Maternity Leave","Paternity Leave"]
    @State var alternateListName  = ["",""]
    @State private var selectedLeaveName: String = ""
    @State private var selectedAlternateName: String = ""
    
    @State private var selectedLeaveID: Int = 1
    @State private var selectedAlternateID: Int = 1
    
    @State private var reason = ""
    let colors = ["Red", "Green", "Blue", "Black", "Tartan"]
    
    @State private var leaveDayType = ""
    let dayType = ["Half Day" , "Full Day"]
    
    @State private var leaveFlag = true
    
    @State private var toDate = Date.now
    @State private var fromdate = Date.now
    private func formattedToDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: toDate)
    }
    
    //    private var formattedFromDate: String {
    //        let dateFormatter = DateFormatter()
    //        dateFormatter.dateFormat = "yyyy-MM-dd"
    //        return dateFormatter.string(from: fromdate)
    //    }
    private func formattedFromDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: fromdate)
    }
    // Function to calculate the number of days between two dates
    private func calculateNumberOfDays(from fromDate: Date, to toDate: Date) -> Int {
        let calendar = Calendar.current
        
        // Check if the dates are the same
        if calendar.isDate(fromDate, equalTo: toDate, toGranularity: .day) {
            return 1 // Return 1 if the dates are the same
        }
        
        let components = calendar.dateComponents([.day], from: fromDate, to: toDate)
        return max(components.day ?? 0, 1) // Return at least 1 day
    }

    
    var body: some View {
        NavigationStack{
            ScrollView{
                if viewmodel.dataModel.isLoading{
                    ProgressView()
                }else{
                    VStack{
                        Text("Leave Date :")
                            .font(.title3)
                            .bold()
                            .frame(maxWidth: .infinity,alignment : .topLeading)
                        
                        HStack {
                            DatePicker( selection: $fromdate, in: ...Date.now, displayedComponents: .date){
                                Text("From Date")
                                    .font(.caption2)
                                    .padding(10)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color("toolbar"))
                                    )
                            }
                            DatePicker( selection: $toDate, displayedComponents: .date){
                                Text("To Date")
                                    .font(.caption2)
                                    .padding(10)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color("toolbar"))
                                    )
                            }
                        }
                        .frame(maxWidth: .infinity)
                        Divider()
                        // for the specified leaves the half day or the full day option is present
                        HStack{
                            Text("Select Leave Type :")
                                .font(.title3)
                                .bold()
                                .frame(maxWidth: .greatestFiniteMagnitude,alignment : .leading)
                            Text(String(selectedLeaveName))
                                .font(.headline)
                                .bold()
                            Button {
                                withAnimation{
                                    isLeaveSelected.toggle()
                                }
                            } label: {
                                Image(systemName: "arrow.down.left")
                            }
                        }
                        
                        if isLeaveSelected{
                            ForEach(viewmodel.dataModel.leaveListName, id: \.self) {item in
                                //                        Button(action: {
                                //                            if let selectedLeave = viewmodel.dataModel.leaveList.first(where: { $0.lname == item }) {
                                //                                let selectedLeaveId = selectedLeave.leave_id
                                //                                // Do whatever you need to do with selectedLeaveId
                                //                                print("Selected leave_id:", selectedLeaveId)
                                //                                self.selectedLeaveID = selectedLeaveId
                                //                                self.viewmodel.getFacultyAvailableLeaveCount(id:self.selectedLeaveID)
                                //                                if self.viewmodel.dataModel.count > 1 {
                                //                                    self.leaveFlag = true
                                //                                }else {
                                //                                    self.leaveFlag = false
                                //                                }
                                //                            }
                                //                            isLeaveSelected.toggle()
                                //                        }, label: {
                                //                            Text("\(item)")
                                //                                .frame(alignment: .leading)
                                //                                .foregroundStyle(Color.white)
                                //                                .padding(10)
                                //                                .background(
                                //                                    RoundedRectangle(cornerRadius: 10)
                                //                                        .fill(isLeaveSelected ? Color.green : Color.orange)
                                //                                )
                                //
                                //                        }).frame(alignment: .leading)
                                leaveItemView(action: {
                                    if let selectedLeave = viewmodel.dataModel.leaveList.first(where: { $0.lname == item }) {
                                        selectedLeaveName = selectedLeave.lname
                                        let selectedLeaveId = selectedLeave.leave_id // to do change
                                        // Do whatever you need to do with selectedLeaveId
                                        print("Selected leave_id:", selectedLeaveId)
                                        
                                        self.selectedLeaveID = selectedLeaveId
                                        self.viewmodel.getFacultyAvailableLeaveCount(id:self.selectedLeaveID)
                                        if self.viewmodel.dataModel.count > 1 {
                                            self.leaveFlag = true
                                            withAnimation{
                                                isLeaveSelected.toggle()
                                            }
                                        }else {
                                            self.leaveFlag = false
                                            withAnimation{
                                                isLeaveSelected.toggle()
                                            }
                                        }
                                        
                                    }
                                }, name: item)
                            }
                        }
                        /*
                         Picker("Leave Type", selection: $selectedLeaveName) {
                         ForEach(dummyLeaveListName, id: \.self) {
                         Text($0)
                         }
                         .frame(maxWidth: .infinity, alignment: .leading)
                         }
                         .onChange(of: selectedLeaveName) { newValue in
                         if let selectedLeave = dummyList.first(where: { $0.lname == newValue }) {
                         let selectedLeaveId = selectedLeave.leave_id
                         // Do whatever you need to do with selectedLeaveId
                         print("Selected leave_id:", selectedLeaveId)
                         self.selectedLeaveID = selectedLeaveId
                         self.viewmodel.getFacultyAvailableLeaveCount(id:self.selectedLeaveID)
                         if self.viewmodel.dataModel.count > 1 {
                         self.leaveFlag = true
                         }else {
                         self.leaveFlag = false
                         }
                         }
                         }te                     .frame(maxWidth: .infinity,alignment: .leading)
                         .padding(10)
                         .background(
                         RoundedRectangle(cornerRadius: 10)
                         .stroke(Color("toolbar"))
                         )
                         .pickerStyle(.menu)
                         */
                        
                        if selectedLeaveID == 2 {
                            Divider()
                            Text("Select the Leave Day Type :")
                                .font(.title3)
                                .bold()
                                .frame(maxWidth: .infinity,alignment : .topLeading)
                            Picker("day type ", selection: $leaveDayType) {
                                ForEach(dayType, id: \.self) {
                                    Text($0)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding(10)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("toolbar"))
                            )
                        }
                        //                    let selectedLeaveName = dummyList.first(where: { $0.leave_id == selectedLeaveID })?.lname
                        
                        Divider()
                        HStack{
                            Text("Select Alternate :")
                                .font(.title3)
                                .bold()
                                .frame(maxWidth: .infinity,alignment : .topLeading)
                            Text(String(selectedAlternateName))
                                .font(.headline)
                                .bold()
                            Button {
                                withAnimation{
                                    isAlternateSelected.toggle()
                                }
                            } label: {
                                Image(systemName: "arrow.down.left")
                            }
                        }
                        if isAlternateSelected{
                            ForEach(viewmodel.dataModel.altenateListName, id: \.self) { item in
                                leaveItemView(action: {
                                    if let selectedLeave = viewmodel.dataModel.alternateList.first(where: { $0.name == item }) {
                                        selectedAlternateName = selectedLeave.name
                                        let selectedLeaveId = selectedLeave.faculty_id // to do change
                                        // Do whatever you need to do with selectedLeaveId
                                        print("Selected leave_id:", selectedLeaveId)
                                        self.selectedAlternateID = selectedLeaveId
                                        withAnimation {
                                            isAlternateSelected.toggle()
                                        }
                                        
                                    }
                                }, name: item)
                            }
                        }
                        /*
                         Picker("alternate", selection: $selectedAlternateName) {
                         ForEach(alternateListName, id: \.self) {
                         Text($0)
                         }
                         .frame(maxWidth: .infinity, alignment: .leading)
                         }
                         .onChange(of: selectedAlternateName) { newValue in
                         if let selectedLeave = alternateList.first(where: { $0.name == newValue }) {
                         let selectedLeaveId = selectedLeave.faculty_id // to do change
                         // Do whatever you need to do with selectedLeaveId
                         print("Selected leave_id:", selectedLeaveId)
                         self.selectedAlternateID = selectedLeaveId
                         }
                         }
                         .frame(maxWidth: .infinity,alignment: .leading)
                         .padding(10)
                         .background(
                         RoundedRectangle(cornerRadius: 10)
                         .stroke(Color("toolbar"))
                         )
                         .pickerStyle(.menu)
                         */
                        Divider()
                        Text("Reason :")
                            .font(.title3)
                            .bold()
                            .frame(maxWidth: .infinity,alignment : .topLeading)
                        TextField("Reason", text: $reason)
                            .keyboardType(.emailAddress).autocapitalization(.none)
                            .padding(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("toolbar"))
                            )
                        Divider()
                        
                        if leaveFlag {
                            Text("Your Available Leaves are \(viewmodel.dataModel.count)")
                                .bold()
                                .frame(maxWidth: .infinity)
                                .foregroundStyle(Color.white)
                                .padding(10)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.green)
                                )
                            
                            Button(action: {
                                //                    pViewModel.getGateAttendance(fromDate: String(formattedFromDate), toDate: String(formattedToDate))
                                print(String(formattedToDate()))
                                print(formattedFromDate())
                                viewmodel.dataModel.from_date = formattedFromDate()
                                viewmodel.dataModel.to_date = formattedToDate()
                                viewmodel.dataModel.reason = reason
                                viewmodel.dataModel.alternate = selectedAlternateID
                                viewmodel.dataModel.leave_id = selectedLeaveID
                                viewmodel.dataModel.half_full_day = leaveDayType
                                viewmodel.dataModel.no_of_date = Double(calculateNumberOfDays(from: fromdate, to: toDate))
                                viewmodel.postApplyLeave()
                                isNaviGateComplete.toggle()
                            }, label: {
                                Text("Apply Leave")
                                
                                    .frame(maxWidth: .infinity)
                                
                                    .foregroundStyle(Color.white)
                                    .padding(10)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color.indigo)
                                    )
                                
                            })
                            //                    Text("\(Double(calculateNumberOfDays(from: fromdate, to: toDate)).rounded())")
                        }else{
                            Text("You Dont Have Enough Leave Balance\n\t\t Select Another Leave!")
                                .bold()
                                .frame(maxWidth: .infinity)
                                .foregroundStyle(Color.white)
                                .padding(10)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.red)
                                )
                        }
                    }
                }
               
            }
            .frame(maxWidth: .infinity,maxHeight:.infinity,alignment:.top)
            .padding(10)
            
            
        }
        .task {
            viewmodel.getLeaveApplicationData()
            dummyList = viewmodel.dataModel.leaveList
            dummyLeaveListName = viewmodel.dataModel.leaveListName
            alternateList = viewmodel.dataModel.alternateList
            alternateListName = viewmodel.dataModel.altenateListName
        }
        .navigationTitle("Apply Leave")
        .navigationDestination(isPresented: $isNaviGateComplete, destination: {
            CompletionScreen(success: viewmodel.dataModel.isShowCompletion, error: viewmodel.dataModel.isShowError)
        })
        .bold()
    }
    
}

struct leaveItemView : View {
    var action : () -> Void
    var name : String
    @State var isAlternateSelected : Bool = false
    var body: some View {
        Button(action: {
            action()
            isAlternateSelected.toggle()
        }, label: {
            Text("\(name)")
                .frame(alignment: .leading)
                .foregroundStyle(Color.white)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(isAlternateSelected ? Color.green : Color.orange)
                )
            
        }).frame(maxWidth:.infinity,alignment: .leading)
    }
}
struct CompletionScreen : View {
    var success : Bool
    var error : Bool
    @State var isNavigateToHome : Bool = false
    var body: some View {
        NavigationStack{
            VStack{
                if success{
                    Text("Leave Applied SuccessFully ")
                    Image(systemName: "checkmark.seal.fill")
                        .resizable()
                        .frame(width: 100,height: 100)
                        .foregroundStyle(Color.green)
                    Button {
                        isNavigateToHome.toggle()
                    } label: {
                        Text("Go To Home")
                    }
                }
                if error{
                    Text("Some Error Occured ..  ")
                    Image(systemName: "xmark.seal.fill")
                        .resizable()
                        .frame(width: 100,height: 100)
                        .foregroundStyle(Color.red)
                    Button {
                        isNavigateToHome.toggle()
                    } label: {
                        Text("Go To Home")
                    }
                }
            }.navigationDestination(isPresented: $isNavigateToHome) {
                FacultyMainScreen()
            }
            .navigationBarBackButtonHidden(true)

        }
    }
}
#Preview {
    FacultyLeaveAppView()
}

//            VStack(spacing: 0) {
//                Rectangle()
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .frame(height: 100)
//                    .foregroundColor(.orange) // Add color for visibility
//
//                HStack {
//                    Rectangle()
//                        .frame(width: 150, height: 100)
//                        .foregroundColor(.orange) // Add color for visibility
//                    Spacer()
//                }
//            }.padding()

/*
 if let selectedLeave = viewmodel.dataModel.alternateList.first(where: { $0.name == item }) {
     let selectedLeaveId = selectedLeave.faculty_id // to do change
     // Do whatever you need to do with selectedLeaveId
     print("Selected leave_id:", selectedLeaveId)
     self.selectedAlternateID = selectedLeaveId
 }
 */
