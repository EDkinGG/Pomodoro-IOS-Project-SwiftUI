//
//  ContentView.swift
//  DevSwiftUI
//
//  Created by Cairocoders
//
 
import SwiftUI
import Firebase
 
struct ContentView: View {
     
    @State private var isUserCurrentlyLoggedOut: Bool = false
     
    var body: some View {
        NavigationView {
            if self.isUserCurrentlyLoggedOut {
                Home(isUserCurrentlyLoggedOut:
                    $isUserCurrentlyLoggedOut)
            }else {
                LoginRegister(isUserCurrentlyLoggedOut: $isUserCurrentlyLoggedOut)
            }
        }
    }
}
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
