//
//  AddNewMenuItemSheetView.swift
//  EasiCash
//
//  Created by Yongye on 8/17/24.
//

import SwiftUI
import PhotosUI

struct AddNewMenuItemSheetView: View {
    
    @Environment(MenuViewModel.self) var viewModel: MenuViewModel
    
    @Binding var presentAddMenuItemSheetView: Bool
    
    @State private var newMenuItemTitle: String = ""
    
    @State private var newMenuItemPrice: Double = 0
    
    @State private var pickerItem: PhotosPickerItem?
    
    @State private var selectedImage: Image?
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    
                    Section {
                        PhotosPicker("Select a picture", selection: $pickerItem, matching: .images)
                    } header: {
                        Text("Upload an image")
                    }
                    
                    Section {
                        TextField("Title", text: $newMenuItemTitle)
                            .keyboardType(.numberPad)
                    } header: {
                        Text("Title")
                    }
                    
                    Section {
                        TextField("Price", value: $newMenuItemPrice, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                    } header: {
                        Text("Price")
                    }
                    
                }
                .onChange(of: pickerItem) {
                    Task {
                        selectedImage = try await pickerItem?.loadTransferable(type: Image.self)
                    }
                }
            }
            .navigationTitle("Add new menu item")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        presentAddMenuItemSheetView = false
                    } label: {
                        Text("Cancel")
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.menuItems.append(.init(imageName: newMenuItemTitle, image: selectedImage, title: newMenuItemTitle, category: .food, price: 10))
                        presentAddMenuItemSheetView = false
                    } label: {
                        Text("Submit")
                    }
                    .disabled(newMenuItemTitle.isEmpty || newMenuItemPrice <= 0 || selectedImage == nil)
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var present: Bool = false
    AddNewMenuItemSheetView(presentAddMenuItemSheetView: $present)
        .environment(MenuViewModel())
}
