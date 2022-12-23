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
    @State var navigatedPomo = false
    @State var navigatedEdit = false
    @State var navigatedAbout = false
    
    
    var body: some View {
        
        NavigationView {
            
            ScrollView{
                
                VStack(alignment: .leading, spacing: 4) {
                    NavigationLink("", destination: PomodoroMain(), isActive: $navigatedPomo)
                    Button(action: { self.navigatedPomo.toggle() } ) {
                        HStack{
                            Image(systemName: "timer")
                            Text("PomoDoro").font(.title)
                        }
                        .modifier(ButtonModifers())
                        .padding()
                    }
                    
    //                Button {
    //                    //API Call
    //                }label: {
    //                    Text("Basic API")
    //                        .bold()
    //                        .frame(width: 200, height: 40)
    //                        .background(
    //                            RoundedRectangle(cornerRadius: 10, style: .continuous)
    //                                .fill(.linearGradient(colors: [.pink, .red], startPoint: .top , endPoint: .bottomTrailing))
    //                        )
    //                        .foregroundColor(.white)
    //                }
    //                .padding(.top)
    //                .offset(y: 0)
                    
                    NavigationLink("", destination: EditProfileView(), isActive: $navigatedEdit)
                    Button(action: {self.navigatedEdit.toggle()}){
                        HStack{
                            Image(systemName: "pencil")
                            Text("Edit Profile").font(.title)
                        }
                        .modifier(ButtonModifers())
                        .padding()
                    }
                    
                    Button(action: {}){
                        HStack{
                            Image(systemName: "doc.text.image.fill")
                            Text("About Us").font(.title)
                        }
                        .modifier(ButtonModifers())
                        .padding()
                    }
                    
                    
                    Button {
                        shouldShowLogOutOptions.toggle()
                    } label: {
                            HStack{
                                Image(systemName: "rectangle.portrait.and.arrow.right.fill")
                                Text("Log Out").font(.title)
                            }
                            .modifier(ButtonModifers())
                            .padding()
                        
    //                    Text("Sign Out")
    //                        .bold()
    //                        .frame(width: 200, height: 40)
    //                        .background(
    //                            RoundedRectangle(cornerRadius: 10, style: .continuous)
    //                                .fill(.linearGradient(colors: [.pink, .red], startPoint: .top , endPoint: .bottomTrailing))
    //                        )
    //                        .foregroundColor(.white)
                    }
    //                .padding(.top)
    //                .offset(y: 100)
                    
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
    }
    
    struct Home_Previews: PreviewProvider {
        @State static var isUserCurrentlyLoggedOut = false
        static var previews: some View {
            Home(isUserCurrentlyLoggedOut: $isUserCurrentlyLoggedOut)
        }
    }
}
