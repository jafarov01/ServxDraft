//
//  ServxStaticData.swift
//  Servx
//
//  Created by Makhlug Jafarov on 12/11/2023.
//

import Foundation

struct ServxStaticData {
    static let serviceCategories: [ServiceCategory] = [
        ServiceCategory(name: "Cleaning", subcategories: [
            ServiceSubcategory(name: "Deep Cleaning"),
            ServiceSubcategory(name: "Carpet Cleaning"),
            ServiceSubcategory(name: "Window Cleaning"),
            ServiceSubcategory(name: "Office Cleaning"),
            ServiceSubcategory(name: "Industrial Cleaning"),
            ServiceSubcategory(name: "Upholstery Cleaning"),
            ServiceSubcategory(name: "Floor Cleaning"),
        ]),
        ServiceCategory(name: "Repairing", subcategories: [
            ServiceSubcategory(name: "Electronics Repair"),
            ServiceSubcategory(name: "Appliance Repair"),
            ServiceSubcategory(name: "Plumbing Repair"),
            ServiceSubcategory(name: "HVAC Repair"),
            ServiceSubcategory(name: "Car Repair"),
            ServiceSubcategory(name: "Computer Repair"),
            ServiceSubcategory(name: "Furniture Repair"),
        ]),
        ServiceCategory(name: "Laundry", subcategories: [
            ServiceSubcategory(name: "Dry Cleaning"),
            ServiceSubcategory(name: "Wash and Fold"),
            ServiceSubcategory(name: "Ironing Service"),
            ServiceSubcategory(name: "Clothing Alterations"),
            ServiceSubcategory(name: "Shoe Repair"),
        ]),
        ServiceCategory(name: "Painting", subcategories: [
            ServiceSubcategory(name: "Interior Painting"),
            ServiceSubcategory(name: "Exterior Painting"),
            ServiceSubcategory(name: "Wall Murals"),
            ServiceSubcategory(name: "Furniture Painting"),
            ServiceSubcategory(name: "Fence Painting"),
        ]),
        ServiceCategory(name: "Appliance", subcategories: [
            ServiceSubcategory(name: "Air Conditioner Repair"),
            ServiceSubcategory(name: "Refrigerator Repair"),
            ServiceSubcategory(name: "Washing Machine Repair"),
            ServiceSubcategory(name: "Water Heater Repair"),
            ServiceSubcategory(name: "TV Repair"),
            ServiceSubcategory(name: "Microwave Repair"),
            ServiceSubcategory(name: "Chimney Repair"),
            ServiceSubcategory(name: "Dishwasher Repair"),
            ServiceSubcategory(name: "Others"),
        ]),
        ServiceCategory(name: "Plumbing", subcategories: [
            ServiceSubcategory(name: "Leak Repair"),
            ServiceSubcategory(name: "Pipe Installation"),
            ServiceSubcategory(name: "Drain Cleaning"),
            ServiceSubcategory(name: "Toilet Repair"),
            ServiceSubcategory(name: "Water Heater Installation"),
            ServiceSubcategory(name: "Faucet Repair"),
        ]),
        ServiceCategory(name: "Shifting", subcategories: [
            ServiceSubcategory(name: "Local Moving"),
            ServiceSubcategory(name: "Long-Distance Moving"),
            ServiceSubcategory(name: "Office Moving"),
            ServiceSubcategory(name: "Furniture Moving"),
            ServiceSubcategory(name: "Packing Services"),
            ServiceSubcategory(name: "Storage Services"),
        ]),
    ]
}
