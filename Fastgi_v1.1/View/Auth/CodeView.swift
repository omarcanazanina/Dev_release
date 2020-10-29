//
//  CodeView.swift
//  Fastgi_v1
//
//  Created by Hegaro on 26/10/2020.
//

import SwiftUI

struct CodeView: View {
    @EnvironmentObject private var authState : AuthState
    @ObservedObject var loginVM = LoginViewModel()
    @ObservedObject var login = Login()
    @State var pin: String = ""
    var number: String
    @State var contTest: Int = 0
    var body: some View {
        VStack(spacing:10) {
            Text("Verificar código")
                .foregroundColor(.white)
                .padding(.top,60)
            Text("Ingresa el código de verificación")
                .padding(.top)
                .font(.caption)
                .foregroundColor(.white)
            HStack{
                TextField("Código", text: $pin)// $telefono)
                    .textContentType(.oneTimeCode)
                    .keyboardType(.numberPad)
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .onTapGesture{
                        self.contTest += 1
                    }
                
                
            }.accentColor(Color("primary"))
            .padding(12)
            .background(Color.white)
            .clipShape(Capsule())
            .frame(width:220)
            
            
            Text("Press \(self.contTest) times")
            
            Button(action: {
            })
            {
                Text("Reenviar SMS")
                    .font(.caption)
                    .foregroundColor(.white)
            }
            
            Button(action: {
                //self.login.confirmCode(telefono: self.number, pin: self.pin)
                
                self.loginVM.verificarCode(telefono: self.number, code: self.pin)
                
                //self.authState.isAuth = true
            })
            {
                Text("Aceptar")
                    .textStyle(TextButtonLoginStyle())
            }
            /*NavigationLink(destination: HomeView(), tag: "idlogin", selection: self.$login.ruta) {
                       EmptyView()
            }*/
            
            if self.loginVM.isloading == true{
                Loader()
            }else if self.loginVM.messageError != ""{
                Text(self.loginVM.messageError)
                    .foregroundColor(.red)
                //self.alert = true
            }
            // .background(Color.black.opacity(0.45).edgesIgnoringSafeArea(.all))
            Spacer()
            Spacer()
        }
        .padding([.top, .leading, .trailing])
        .frame(maxWidth:.infinity, maxHeight: .infinity)
        .background(Color("primary"))
    }
}

struct CodeView_Previews: PreviewProvider {
    static var previews: some View {
        CodeView(number: "")
    }
}
