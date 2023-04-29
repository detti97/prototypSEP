//
//  CustomerPrototypView.swift
//  prototypSEP
//
//  Created by Jan Dettler on 27.04.23.
//

/*
 This code is written in Swift and is a view for the customer app. This view is a prototype in wich key elements for the final implementation are tested.
 The qr code will be generated when the button is klicked. The qr code contains the strings of firstName, street and zip. After each string comes the '&' symbol.
 All available zip codes are saved in an array wich than can be used to diplay in a Picker().
 
 
 */


import SwiftUI
import CoreImage.CIFilterBuiltins
import CoreImage


struct CustomerPrototypView: View {
    
    let zipCodes = ["49808", "49809", "49811"] //all zip codes of Lingen
    
    // Create a Core Image context and a QR code filter
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    // Define a state variable for the generated QR code
    @State private var qrCode: UIImage? = nil
    
    // Define state variables for the first name, street, and zip code
    @State private var  firstName: String = ""
    @State private var  street: String = ""
    @State private var  zip: String = ""
    
    
    var body: some View {
        NavigationView{
            
            Form{
                Section(header: Text("Ihr Name")) {
                    TextField("Vorname", text: $firstName)
                }
                Section(header: Text("Ihre Adresse")) {
                    TextField("Straße", text: $street)
                    
                    Picker("Postleitzahl", selection: $zip) {
                        ForEach(zipCodes, id: \.self) { zip in Text(zip)
                        }
                        
                    }
                    .pickerStyle(.segmented)
                }
                
                Button("QR Code generieren"){
                    let address = firstName + "&" + street + "&" + zip
                    print (address)
                    qrCode = generateQRCode(from: address)
                }
                if let image = qrCode {
                    Image(uiImage: image)
                        .resizable()
                        .interpolation(.none)
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        
                }
            }
            .navigationTitle("Neue Adresse")
            
        }
    }
    
    // Define a function to generate a QR code from a string
    func generateQRCode(from string: String) -> UIImage {
        filter.message = Data(string.utf8)

        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }

        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

struct CustomerPrototypView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerPrototypView()
    }
}
