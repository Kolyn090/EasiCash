//
//  CheckoutListView.swift
//  EasiCash
//
//  Created by CHENGTAO on 8/17/24.
//

import SwiftUI

struct CheckoutListView: View {
    
    @Environment(MenuViewModel.self) var menuViewModel: MenuViewModel
    
    @Environment(SaleViewModel.self) var saleViewModel: SaleViewModel
    
    @State private var orderType: OrderType = .inStore
    
    @State private var customerName: String = ""
    
    @State private var additionalInfo: String = ""
    
    @State private var clearOrder: Bool = false
    
    var body: some View {
        @Bindable var menuViewModel = menuViewModel
        
        if menuViewModel.customerSelectedItems.items.count > 0 {
            
            VStack {
                
                List {
                    Section {
                        ForEach($menuViewModel.customerSelectedItems.items) { item in
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
                
                // Total Price UI
                HStack {
                    Text("Total Price:")
                        .font(.headline)
                        .foregroundColor(.primary)
                    Spacer()
                    Text(String(format: "$%.2f", viewModel.totalPrice))
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
                .padding()
                .cornerRadius(10)
                .padding([.leading, .trailing, .bottom], 20)
                
                
                HStack(spacing: 20) {
                    
                    Button(role: .destructive) {
                        clearOrder.toggle()
                    } label: {
                        Text("Clear")
                    }
                    
                    .buttonStyle(.borderedProminent)
                    
                    Button {
                        saleViewModel.addSale(
                            with: menuViewModel.customerSelectedItems,
                            name: customerName,
                            note: additionalInfo,
                            type: orderType
                        )
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
                        menuViewModel.clearOrder()
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
