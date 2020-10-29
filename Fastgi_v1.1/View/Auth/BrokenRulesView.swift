//
//  BrokenRulesView.swift
//  Fastgi_v1.1
//
//  Created by Hegaro on 28/10/2020.
//

import SwiftUI

struct BrokenRulesView: View {
    let brokenRules: [BrokenRule]
   
   var body: some View {
       VStack{
           ForEach(self.brokenRules, id: \.id) { brokenRule in
               Text(brokenRule.message)
                   .foregroundColor(.red)
                   .font(.caption)
                   .padding(6)
                   .frame(maxWidth:.infinity, alignment: .leading)
                   .background(Color.black.opacity(0.2))
               .cornerRadius(6)
               
           }
       }

   }
}

struct BrokenRulesView_Previews: PreviewProvider {
    static var previews: some View {
        BrokenRulesView(brokenRules: [])
    }
}
