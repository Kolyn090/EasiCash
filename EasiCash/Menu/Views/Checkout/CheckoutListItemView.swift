//
//  CheckoutListItemView.swift
//  EasiCash
//
//  Created by CHENGTAO on 8/17/24.
//
import SwiftUI

struct CheckoutListItemView: View {
//    @Binding var itemTitle: String
//    @Binding var itemPrice: Double
//    @Binding var itemQuantity: Int
    @Binding var item: Item
    
    private var quantityFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        return formatter
    }
    
    var body: some View {
        VStack {
            // Title and price
            HStack {
                Text(item.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .padding(.leading, 16)
                Spacer()
                
                Text(String(format: "$%.2f", item.price))
                    .font(.headline)
                    .foregroundColor(.primary)
                    .padding(.trailing, 16)
            }
            
            // Quantity and controls
            HStack {
                Text("Quantity:")
                    .font(.headline)
                    .foregroundColor(.primary)
                    .padding(.leading, 16)
                Spacer()
                
                // Button for increasing and decreasing the quantity
                HStack {
                    Button {
                        if item.quantity > 0 {
                            item.quantity -= 1
                        }
                    } label: {
                        Image(systemName: "minus")
                    }
                    
                    TextField("Quantity", value: $item.quantity, formatter: quantityFormatter)
                        .frame(width: 50)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .multilineTextAlignment(.center)
                    
                    Button {
                        item.quantity += 1
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

//
//struct CheckoutListItemView_Previews: PreviewProvider {
//    @State static private var title = "Title"
//    @State static private var price = 9.99
//    @State static private var quantity = 5
//    
//    static var previews: some View {
//        CheckoutListItemView(itemTitle: $title, itemPrice: $price, itemQuantity: $quantity)
//    }
//}
