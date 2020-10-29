//
//  Styles.swift
//  fastgi
//
//  Created by hegaro on 8/10/20.
//  Copyright © 2020 Hegaro. All rights reserved.
//

import SwiftUI



/*Login button style*/
struct LoginButtonStyle: ButtonStyle{
    func makeBody(configuration: Self.Configuration) -> some View{
        configuration.label
            
            .foregroundColor(.white)
            .padding(12)
            .frame(maxWidth:200)
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(Color.white, lineWidth: 1))
    }
}

/*Button Primary style*/
struct PrimaryButtonStyle: ButtonStyle{
    func makeBody(configuration: Self.Configuration) -> some View{
        configuration.label
            
            .foregroundColor(Color.white)
            .frame(maxWidth:.infinity)
            .padding(8)
            .background(Color("primary"))
            .clipShape(Capsule())
            .shadow(color: Color.black.opacity(0.1), radius: 2, x: 1, y: 1)
            .padding()
    }
}

/*Button Primary style*/
struct PrimaryButtonOutlineStyle: ButtonStyle{
    func makeBody(configuration: Self.Configuration) -> some View{
        configuration.label
            
            .foregroundColor(Color("primary"))
            .frame(maxWidth:.infinity)
            .padding(8)
            .clipShape(Capsule())
            .overlay(
            RoundedRectangle(cornerRadius: 50)
                .stroke(Color("primary"), lineWidth: 1))
            .padding()

    }
}



/*Style Navigation bar hidde*/
struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
    }
}
/*Style Navigation bar hidde*/
extension View {
    func hiddenNavigationBarStyle() -> some View {
        modifier( HiddenNavigationBar() )
    }
}


/*Style Texts*/

extension Text {
    func textStyle<Style: ViewModifier>(_ style: Style) -> some View {
        ModifiedContent(content: self, modifier: style)
    }
}

//
struct TextButtonLoginStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.white)
            .frame(maxWidth:200)
            .padding(12)
            .background(Color("primary"))
           
            .clipShape(Capsule())
            
            .shadow(color: Color.black.opacity(0.1), radius: 4, x: 2, y: 3)
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(Color.white, lineWidth: 0.5)
                    //Disable touchs
                    .allowsHitTesting(false)
            )
        
    }
}

struct TitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            //.foregroundColor(Color("primary"))
            .lineSpacing(8)
            .font(.caption)
            .opacity(0.5)
        
    }
}


/*Style TextField*/
extension TextField {
    func textFieldStyle<Style: ViewModifier>(_ style: Style) -> some View {
        ModifiedContent(content: self, modifier: style)
    }
}

struct Input: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal,12)
            .padding(.vertical,8)
            .background(Color("input"))
            .clipShape(Capsule())
        
    }
}


func UIColorPrimary() -> UIColor {
    return UIColor(red: 0.44, green: 0.13, blue: 0.92, alpha: 1)
}
