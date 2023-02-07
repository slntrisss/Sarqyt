//
//  RegistrationView.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 01.02.2023.
//
import PhotosUI
import SwiftUI

struct RegistrationView: View {
    
    @State private var firstname = ""
    @State private var lastname = ""
    @State private var phoneNumber = ""
    @State private var selectedGender = ""
    @State private var dateOfBirthLabel = ""
    @State private var dateOfBirth = Date.now
    @State private var showingDialog = false
    
    private let genders = ["Male", "Female"]
    @FocusState private var inFocus: Field?
    @State private var selectedImage: UIImage?
    @State private var filterType: PHPickerFilter = .images
    @State private var showingCamera = false
    @State private var showingPhotoLibrary = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            ProfileImageView(image: selectedImage)
                .onTapGesture {
                    showingDialog = true
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.green)
                        .frame(width: 30, height: 30)
                        .overlay(
                            Image(systemName: "square.and.pencil")
                                .font(.body.weight(.heavy))
                                .foregroundColor(.white)
                        ),
                    alignment: .bottomTrailing)
            
            VStack(spacing: 20){
                TextField("Firstname", text: $firstname, onCommit: {
                    inFocus = .lastName
                })
                .submitLabel(.next)
                .focused($inFocus, equals: .firstName)
                .padding()
                .customTextField()
                
                TextField("Lastname", text: $lastname, onCommit: {
                    inFocus = .date
                })
                .submitLabel(.next)
                .focused($inFocus, equals: .lastName)
                .padding()
                .customTextField()
                
                HStack{
                    TextField("Date of birth DD/MM/YYYY", text: $dateOfBirthLabel, onCommit: {
                        inFocus = .phoneNumber
                    })
                    .submitLabel(.next)
                    .focused($inFocus, equals: .date)
                    .keyboardType(.numberPad)
                    .onChange(of: dateOfBirthLabel, perform: {_ in formatDateLabel()})
                    .onChange(of: dateOfBirth, perform: {_ in formatDate()})
                    .padding()
                    DatePickerView(date: $dateOfBirth)
                }
                .customTextField()
                
                TextField(phoneNumber.isEmpty ? "Phone number" : phoneNumber, text: $phoneNumber)
                    .keyboardType(.numberPad)
                    .focused($inFocus, equals: .phoneNumber)
                    .padding()
                    .customTextField()
                    .onChange(of: phoneNumber, perform: { _ in
                        phoneNumber.toPhoneNumber()
                    })
                
                DropDownGenderPickerView(selectedGender: $selectedGender)
                
                PrimaryButton(buttonLabel: "Continue"){
                    print("Registration view \"continue\" button clicked.")
                }
            }
            .padding(.top)
        }
        .toolbar{
            ToolbarItem(placement: .keyboard) {
                HStack{
                    Button(inFocus == .phoneNumber ? "done" : "next"){
                        switch inFocus{
                        case .firstName: inFocus = .lastName
                        case .lastName: inFocus = .date
                        case .date: inFocus = .phoneNumber
                        default: inFocus = nil
                        }
                    }
                    Spacer()
                }
            }
        }
        .confirmationDialog("Set Profile Picture", isPresented: $showingDialog){
            Button("Choose from library"){
                showingPhotoLibrary = true
            }
            Button("Take a photo"){
                showingCamera = true
            }
        }
        .sheet(isPresented: $showingPhotoLibrary){
            ImagePicker(selectedImage: $selectedImage)
        }
        .sheet(isPresented: $showingCamera){
            TakeImageService(selectedImage: $selectedImage)
        }
        .padding()
    }
    
    private func formatDateLabel(){
        if dateOfBirthLabel.count > 10{
            dateOfBirthLabel = String(dateOfBirthLabel.dropLast())
        }
        dateOfBirthLabel.toDateFormat()
    }
    
    private func formatDate(){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        dateOfBirthLabel = formatter.string(from: dateOfBirth)
    }
    
    private func formatPhoneNumber(){
        if phoneNumber.count > 11{
            phoneNumber = String(phoneNumber.dropLast())
        }
        phoneNumber.toPhoneNumber()
    }
    
    private enum Field: Hashable{
        case firstName, lastName, date, phoneNumber
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            RegistrationView()
                .navigationTitle("Fill your profile")
        }
    }
}
