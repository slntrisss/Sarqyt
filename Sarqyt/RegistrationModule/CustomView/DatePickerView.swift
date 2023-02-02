//
//  DatePickerView.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 01.02.2023.
//

import SwiftUI
struct DatePickerView: View {

    @Binding var date: Date
    @State private var isChild = false
    @State private var ageFilter = ""

    var body: some View {

        Image(systemName: "calendar")
          .font(.title3)
          .foregroundColor(.secondary)
          .overlay{
             DatePicker(
                 "",
                 selection: $date,
                 displayedComponents: [.date]
             )
              .blendMode(.destinationOver)
          }
    }
}
