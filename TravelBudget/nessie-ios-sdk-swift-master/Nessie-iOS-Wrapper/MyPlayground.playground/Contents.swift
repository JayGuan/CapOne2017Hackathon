//: Playground - noun: a place where people can play

import UIKit

func testGetCustomers() {
    // Retrieve all the Customers!
    CustomerRequest().getCustomers({(response, error) in
        if (error != nil) {
            // optionally handle the error here
            print(error)
        } else {
            // we are expecting back an array of customers. Type check!
            if let array = response as Array<Customer>? {
                // if there are Customers in the result, print the first Customer
                if array.count > 0 {
                    let customer = array[0] as Customer?
                    self.testGetCustomer(customer!.customerId)
                    print(array)
                } else {
                    print("No accounts found")
                }
            }
        }
    })
}
