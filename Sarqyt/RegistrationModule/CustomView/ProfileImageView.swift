//
//  ProfileImageView.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 02.02.2023.
//

import SwiftUI
struct ProfileImageView: View{
    let image: UIImage?
    var body: some View{
        if let image = image {
            Image(uiImage: image)
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .shadow(color: .black, radius: 1, x: 3, y: 0)
        }else{
            Image(systemName: "person.circle")
                .resizable()
                .foregroundColor(.secondary)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
        }
    }
}
