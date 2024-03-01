//
//  SingleMainCategoryView.swift
//  Servx
//
//  Created by Makhlug Jafarov on 11/11/2023.
//

import SwiftUI

struct SingleMainCategorySubCategoriesListView: View {
    var category: ServiceCategory
    
    var body: some View {
        VStack {
            HStack {
                ServxTextView(text: "Choose a subcategory", fontStyle: "poppins", fontSize: 16, fontColor: .black, isBold: true, isItalic: false, textAlignment: .center)
                
                Spacer()
            }
            .padding(.leading, 24)
            
            Spacer()
            
            ScrollView {
                ForEach(category.subcategories, id: \.name) { subcategory in
                    NavigationLink{
                        SingleSubCategoryServicesListView(serviceCategory: category, serviceSubcategory: subcategory)
                    }
                    label: {
                        HStack(alignment: .center) {
                            ServxTextView(text: subcategory.name, fontStyle: "poppins", fontSize: 16, fontColor: .black, isBold: false, isItalic: false, textAlignment: .center)
                                .padding(.leading, 24)
                            
                            Spacer()
                            
                            Image("arrowIcon")
                                .padding(.trailing, 24)
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 16)
                        .background(.white)
                        .cornerRadius(12)
                        .shadow(color: .black.opacity(0.1), radius: 30, x: 0, y: 4)
                    }
                    .padding(.horizontal, 24)
                }
                .padding(.top, 24)
            }
        }
        .navigationTitle(category.name)
    }
}
#Preview {
    SingleMainCategorySubCategoriesListView(category: ServxStaticData.serviceCategories[0])
}
