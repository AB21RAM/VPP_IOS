//
//  FacultyTakeChargeView.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 05/03/24.
//

import SwiftUI

struct FacultyTakeChargeView: View {
    @StateObject var viewmodel = FacultyTakeChargeViewModel()
    var body: some View {
        ScrollView{
            LazyVStack(alignment: .center, content: {
                ForEach(viewmodel.dataModel.leaves) { data in
                    HStack{
                        VStack{
                            Text("\(data.fDate)-\(data.tDate)")
                                .font(.headline)
                                .frame(maxWidth: .infinity,alignment: .leading)
                            Text(data.fname)
                                .bold()
                                .font(.title2)
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: .infinity,alignment: .leading)
                            Text(data.reason)
                                .font(.headline)
                                .frame(maxWidth: .infinity,alignment: .leading)
                            Text(data.nod)
                                .font(.headline)
                                .frame(maxWidth: .infinity,alignment: .leading)
                        }
                        
                        .frame(maxWidth: .infinity,alignment: .leading)
                        VStack{
                            Button(action: {
                                // Make Appropriate API call
                                viewmodel.dataModel.appId = data.fAppId
                                viewmodel.dataModel.status = 1
//                                defer {
                                    viewmodel.postTakeCharge()
//                                }
                            }) {
                                Text("Accept")
//                                    .frame(width: .infinity)
                                    .bold()
                                    .padding(10)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color.green)
                                    )
                                    .font(.callout)
                                    .foregroundStyle(Color.white)
                            }
                            .alert(
                                isPresented: $viewmodel.dataModel.isShowCompletion, content: {
                                    Alert(title: Text("Status.."), message: Text("Success..."), dismissButton: .cancel(Text("Ok")))
                                })
                            Button(action: {
                                // Make Appropriate API call
                                viewmodel.dataModel.appId = data.fAppId
                                viewmodel.dataModel.status = 2
//                                defer {
                                    viewmodel.postTakeCharge()
//                                }
                            }) {
                                Text("Decline")
//                                    .frame(width: .infinity)
                                    .bold()
                                    .padding(10)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color.red)
                                    )
                                    .font(.callout)
                                    .foregroundStyle(Color.white)
                            }.alert(
                                isPresented: $viewmodel.dataModel.isShowError, content: {
                                    Alert(title: Text("Erros"), message: Text("No Success..."), dismissButton: .cancel(Text("Ok")))
                                })
                        }
                    }
                    .modifier(CardModifier(paddingValue: 15, backgroundColor: Color(.white), cornerRadius: 10, foregroundColor: Color("toolbar"), font: .title2))
                    .shadow(radius: 5)
                    
                    
                }
            })
        }.navigationTitle("Take Charge ")
            .bold()
    }
}

#Preview {
    FacultyTakeChargeView()
}
