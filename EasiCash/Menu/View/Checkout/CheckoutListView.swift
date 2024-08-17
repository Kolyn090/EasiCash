//
//  CheckoutListView.swift
//  EasiCash
//
//  Created by CHENGTAO on 8/17/24.
//

import SwiftUI

struct CheckoutListView: View {
    
    @Environment(MenuViewModel.self) var viewModel: MenuViewModel
    
    @State private var orderType: OrderType = .inStore
    
    @State private var customerName: String = ""
    
    @State private var additionalInfo: String = ""
    
    @State private var clearOrder: Bool = false
    
    var body: some View {
        @Bindable var viewModel = viewModel
        
        if viewModel.customerSelectedItems.items.count > 0 {
            
            VStack {
                
                List {
                    Section {
                        ForEach($viewModel.customerSelectedItems.items) { item in
                            CheckoutListItemView(item: item)
                        }
                    } header: {
                        Text("Order list")
                    }
                    
                    Section {
                        Picker("Pick one order type", selection: $orderType) {
                            ForEach(OrderType.allCases, id: \.self) {
                                Text($0.rawValue)
                            }
                        }
                        .pickerStyle(.segmented)
                        
                    } header: {
                        Text("Order Type")
                    }
                    .listRowSeparator(.hidden)
                    
                    Section {
                        TextField("Customer Name", text: $customerName)
                            .textFieldStyle(.roundedBorder)
                        TextField("Additional Info", text: $additionalInfo)
                            .textFieldStyle(.roundedBorder)
                    } header: {
                        Text("Customer Info")
                    }
                    .listRowSeparator(.hidden)
                    
                }
                .listStyle(.plain)
                
                
                Spacer()
                
                HStack(spacing: 20) {
                    
                    Button(role: .destructive) {
                        clearOrder.toggle()
                    } label: {
                        Text("Clear")
                    }
                    
                    .buttonStyle(.borderedProminent)
                    
                    Button {
                        
                    } label: {
                        Label("Checkout", systemImage: "cart")
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(10)
                }
                
            }
            .alert("Are you sure you want to clear the order?", isPresented: $clearOrder) {
                Button("No") { }
                Button("Yes") {
                    withAnimation {
                        viewModel.clearOrder()
                    }
                }
            }
        } else {
            Text("No item selected")
        }
    }
}

#Preview {
    CheckoutListView()
        .environment(MenuViewModel.mock)
}
