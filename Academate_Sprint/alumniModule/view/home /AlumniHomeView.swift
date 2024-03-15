//
//  AlumniHomeView.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 13/03/24.
//

import SwiftUI

struct AlumniHomeView: View {
    var Ddata : [statusCardItem] = [statusCardItem( name: "Name", ID: "ID", passing_year: "1234", Email: "12345"),statusCardItem( name: "Name", ID: "ID", passing_year: "1234", Email: "12345")]
    var body: some View {
        
        //        HStack{
        //            Text("Hello, Home")
        //            VStack{
        //                Text("Hello, Home")
        //                Text("Hello, Home")
        //                Text("Hello, Home")
        //                Text("Hello, Home")
        //            }
        //        }
        
        // Data To Be Added 
        
        
        LazyVStack(alignment: .center, content: {
            ForEach(Ddata) { count in
                AlumniApplicationStatusCard(name: count.name, ID: count.Email, passing_year: count.passing_year, Email: count.Email)
            }
        })
        
        
    }
}
struct statusCardItem: Identifiable{
    var id = UUID()
    var name : String
    var ID : String
    var passing_year : String
    var Email : String
}
#Preview {
    AlumniHomeView()
}
