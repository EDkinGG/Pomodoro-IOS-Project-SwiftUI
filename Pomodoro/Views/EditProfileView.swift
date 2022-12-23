//
//  EditProfileView.swift
//  Pomodoro
//
//  Created by Ashfaq on 12/23/22.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @State private var uname = ""
    @State private var mail = ""
    @State private var address = ""
    @State private var phone = ""
    @State private var age = ""
    
    @State private var profileImage: Image?
    
    @State private var pickedImage: Image?
    @State private var showingActionSheet = false
    @State private var showingImagePicker = false
    @State private var imageData: Data = Data()
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    
    @StateObject var photoPicker = PhotoPicker()
    
    
//    func loadImage() {
//        guard let inputImage = pickedImage else
//        {
//            return
//        }
//        profileImage = inputImage
//    }
    
    
    
    var body: some View {
        
        NavigationStack{
//            ScrollView{
                VStack
                {
                        VStack{
                            if let image = photoPicker.image {
                                image
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 150, height: 150)
                                .padding(.top, 20)
                                } else {
                                    Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .clipShape(Circle())
                                    .frame(width: 150, height: 150)
                                    .padding(.top, 20)
                            }
                        }
                        .padding()
                        .navigationTitle("Profile Details")
                        .font(.system(size: 32, weight: .heavy))
                        .toolbar{
                            ToolbarItem(placement: .navigationBarTrailing) {
                                PhotosPicker(selection: $photoPicker.imageSelection,
                                             matching: .images,
                                             photoLibrary: .shared()) {
                                    Image(systemName: "photo")
                                        .imageScale(.large)
                                }
                            }
                        }

                    
//                    VStack{
//                        Group{
//
//                            if
//
//                            if profileImage != nil {
//                                profileImage!.resizable()
//                                    .clipShape(Circle())
//                                    .frame(width: 150, height: 150)
//                                    .padding(.top, 20)
//                                    .onTapGesture{
//                                        showingActionSheet.toggle()
//                                    }
//                            } else {
//                                Image(systemName: "person.circle.fill")
//                                    .resizable()
//                                    .clipShape(Circle())
//                                    .frame(width: 150, height: 150)
//                                    .padding(.top, 20)
//                                    .onTapGesture{
//                                        showingActionSheet.toggle()
//                                    }
//
//                            }
//                        }
//                    }.sheet(isPresented: $showingImagePicker, onDismiss: loadImage){
//                        ImagePicker(pickedImage: self.$pickedImage, showImagePicker: self.$showingImagePicker, imageData: self.$imageData)
//                    }.actionSheet(isPresented: $showingActionSheet ) {
//                        ActionSheet(title: Text(""), buttons: [
//                            .default(Text("Choose a Photo")){
//                                self.sourceType = .photoLibrary
//                                self.showingImagePicker = true
//                            },
//                            .default(Text("Take A Photo")){
//                                self.sourceType = .camera
//                                self.showingImagePicker = true
//                            }, .cancel()
//                        ])
//                    }
                    
//                    Group{
                        FormField(value: $uname, icon: "person.fill", placeholder: "UserName")
                        
                        FormField(value: $uname, icon: "person.crop.square.filled.and.at.rectangle.fill", placeholder: "E-mail")
                        
                        FormField(value: $uname, icon: "location.north.circle.fill", placeholder: "Address")
                        
                        FormField(value: $uname, icon: "phone.fill", placeholder: "Phone")
                        
//                        FormField(value: $uname, icon: "person.badge.clock.fill", placeholder: "Age")
                        
//                    }

                    Button(action: {}){
                        HStack{
                            Image(systemName: "checkmark.circle")
                            Text("Save").font(.title)
                        }
                        .modifier(ButtonModifers())
                        .padding()
                    }
                    
                }
//            }
        }
 
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
