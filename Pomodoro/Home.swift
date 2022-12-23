//
//  Home.swift
//  Pomodoro
//
//  Created by Ashfaq on 12/9/22.
//

import SwiftUI
import Firebase

struct Home: View {
    
    @State var shouldShowLogOutOptions = false
    @Binding var isUserCurrentlyLoggedOut : Bool
    @State var navigated = false
    
    
    var body: some View {
        NavigationView {
            
            VStack(alignment: .leading, spacing: 4) {
                NavigationLink("", destination: PomodoroMain(), isActive: $navigated)
                Button(action: { self.navigated.toggle() },label: {
                    Text("Start Pomodoro")
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.linearGradient(colors: [.pink, .red], startPoint: .top , endPoint: .bottomTrailing))
                        )
                        .foregroundColor(.white)
                })
                .padding(.top)
                .offset(y: -10)
                
                
                
                Button {
                    //API Call
                }label: {
                    Text("Basic API")
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.linearGradient(colors: [.pink, .red], startPoint: .top , endPoint: .bottomTrailing))
                        )
                        .foregroundColor(.white)
                }
                .padding(.top)
                .offset(y: 0)
                Button {
                    shouldShowLogOutOptions.toggle()
                } label: {
                    Text("Sign Out")
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.linearGradient(colors: [.pink, .red], startPoint: .top , endPoint: .bottomTrailing))
                        )
                        .foregroundColor(.white)
                }
                .padding(.top)
                .offset(y: 100)
                
            }
            .padding()
            .actionSheet(isPresented: $shouldShowLogOutOptions) {
                .init(title: Text("Settings"), message: Text("What do you want to do?"), buttons: [
                    .destructive(Text("Sign Out"), action: {
                        print("handle sign out")
                        try? Auth.auth().signOut()
                        self.isUserCurrentlyLoggedOut = false
                    }),
                    .cancel()
                ])
            }
        }
    }
    
    struct Home_Previews: PreviewProvider {
        @State static var isUserCurrentlyLoggedOut = false
        static var previews: some View {
            Home(isUserCurrentlyLoggedOut: $isUserCurrentlyLoggedOut)
        }
    }
}
