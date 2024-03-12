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
    var body: some View {
        Text("Parent Main Screen")
        //componets needed -> date Picker , lazyVstack etc 
    }
}

#Preview {
    ParentMainScreen()
}
