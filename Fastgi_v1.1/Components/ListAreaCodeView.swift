//
//  ListAreaCodeView.swift
//  fastgi
//
//  Created by hegaro on 8/10/20.
//  Copyright © 2020 Hegaro. All rights reserved.
//

import SwiftUI

struct ListAreaCodeView: View {
    @Binding var showingSheet:Bool
    @Binding var code:String
    @Binding var country:String
    
    
    
    var listCodes:some View{
        List{
            Button(action: {
                self.showingSheet = false
                self.code = "+591"
                self.country = "Bolivia"
            })
            {
                HStack(){
                    Text("🇧🇴 Bolivia")
                    Spacer()
                    Text("+591")
                }
                
            }
            Button(action: {
                self.showingSheet = false
                self.code = "+54"
                self.country = "Argentina"
            })
            {
                HStack(){
                    Text("🇦🇷 Argentina")
                    Spacer()
                    Text("+54")
                }
                
            }
            
        }
    }
    
    var body: some View {
        
        NavigationView {
            
            self.listCodes
                
                .navigationBarTitle(Text("Elige un país"), displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    
                    print("Dismissing sheet view...")
                    self.showingSheet = false
                    
                }) {
                    Text("Cerrar").bold()
                        .foregroundColor(Color("primary"))
                })
        }
        
    }
}

struct ListAreaCodeView_Previews: PreviewProvider {
    
    @State static var showingSheet = true
    @State static var code: String = ""
    @State static var country: String = ""
    
    static var previews: some View {
        ListAreaCodeView(showingSheet: $showingSheet,code: $code, country: $country)
    }
}

