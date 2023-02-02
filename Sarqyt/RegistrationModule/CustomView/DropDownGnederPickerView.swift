//
//  DropDownGnederPickerView.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 02.02.2023.
//

import SwiftUI

struct DropDownGenderPickerView: View{
    @State private var isExpanded = false
    @Binding var selectedGender: String
    @State private var selected = false
    private let genders = ["Male", "Female"]
    var body: some View{
        DisclosureGroup(genderTitle, isExpanded: $isExpanded) {
            ForEach(genders, id: \.self) { gender in
                Text(gender)
                    .foregroundColor(.gray.opacity(0.7))
                    .padding(2)
                    .onTapGesture {
                        selectedGender = gender
                        selected = true
                        withAnimation {
                            isExpanded = false
                        }
                    }
            }
        }
        .tint(selected ? .black : .gray.opacity(0.7))
        .padding()
        .customTextField()
    }
    
    var genderTitle: String {
        if selectedGender.isEmpty{
            return "Gender"
        }
        return selectedGender
    }
}
