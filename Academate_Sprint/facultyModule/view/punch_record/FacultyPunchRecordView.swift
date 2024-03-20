//
//  FacultyPunchRecordView.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 05/03/24.
//

import SwiftUI

struct FacultyPunchRecordView: View {
    @StateObject var viewModel = FacultyPunchRecordViewModel()
    var body: some View {
        ScrollView(.vertical){
            LazyVStack{
                ForEach(viewModel.dataModel.punch){ item in
                    PunchRecordCard(date: item.dateKey, pIn: item.data.0, pOut: item.data.1)
                }
            }
            
//            PunchRecordCard()
//            PunchRecordCard()
        }
    }
}

#Preview {
    FacultyPunchRecordView()
}
