//
//  LoginView.swift
//  Fastgi_v1
//
//  Created by Hegaro on 26/10/2020.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var loginVM = LoginViewModel()
    
    @State var showingSheet = false
    @State var code: String = "+591"
    @State var phone: String = ""
    @State var country: String = "Bolivia"
    
    @ObservedObject var login = Login()
    @State var telefono: String = ""
    
    init(){
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationView{
            VStack(spacing:10) {
                       Text("Fastgi")
                           .font(.largeTitle)
                           .foregroundColor(.white)
                           .padding(.top)
                       
                       Text("Te enviaremos un sms con el código de verificación")
                           .font(.caption)
                           .foregroundColor(.white)
                           .padding(.bottom)
                       
                       /*Button select codes*/
                       Button(action: {
                           self.showingSheet.toggle()
                       }) {
                           HStack{
                               
                               Text(self.country)
                                   .foregroundColor(.white)
                               Image(systemName: "arrowtriangle.down.fill")
                                   .font(.system(size: 10))
                                   .foregroundColor(.white)
                           }
                       }.sheet(isPresented: $showingSheet) {
                           ListAreaCodeView(
                               showingSheet: self.$showingSheet,
                               code: self.$code,
                               country: self.$country)
                       }
                     
                       /*Inputs code and phone*/
                       HStack{
                           TextField("Código", text: $code)
                               .padding(12)
                               .background(Color.white)
                               .foregroundColor(.black)
                               .keyboardType(.namePhonePad)
                               .frame(maxWidth:120)
                               .clipShape(Capsule())
                           
                           TextField("Teléfono", text: self.$loginVM.telefono.bound)// $telefono)
                            .keyboardType(.numberPad)
                               .padding(12)
                               .background(Color.white)
                               .foregroundColor(.black)
                               .keyboardType(.namePhonePad)
                               .clipShape(Capsule())
                        
                       }
                    BrokenRulesView(brokenRules: self.loginVM.brokenRules)
                
                       Button(action: {
                        //self.login.loginDetail(telefono: "12121212")
                        self.loginVM.validationInput()
                        self.login.loginDetail(telefono: self.loginVM.telefono.bound)
                       })
                       {
                           Text("Ingresar")
                       }.buttonStyle(LoginButtonStyle())
                       Spacer()
                       
                NavigationLink(destination: CodeView(number: self.loginVM.telefono.bound), tag: "idlogin", selection: self.$login.ruta) {
                           EmptyView()
                }
                
            }
                   .padding([.top, .leading, .trailing])
                   .frame(maxWidth:.infinity, maxHeight: .infinity)
                   .background(Color("primary"))
                   .edgesIgnoringSafeArea(.all)
        }
       
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
