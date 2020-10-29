//
//  Loader.swift
//  Fastgi_v1
//
//  Created by Hegaro on 27/10/2020.
//

import SwiftUI

struct Loader: View {
    @State var animate = false
    var body: some View {
        VStack{
            Circle()
                .trim(from: 0, to: 0.8)
                .stroke(AngularGradient(gradient: .init(colors: [.blue,.purple]), center: .center), style: StrokeStyle(lineWidth: 8, lineCap: .round))
                .frame(width: 45, height: 45)
                .rotationEffect(.init(degrees: self.animate ? 360 : 0))
                .animation(Animation.linear(duration: 0.7).repeatForever(autoreverses: false))
            Text("Loading...").padding(.top)
       
        }
        .padding(20)
        .background(Color.white)
        .cornerRadius(15)
        .onAppear(){
            self.animate.toggle()
        }
    }
}

struct Loader_Previews: PreviewProvider {
    static var previews: some View {
        Loader()
    }
}
