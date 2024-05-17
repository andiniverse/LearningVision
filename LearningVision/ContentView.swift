//
//  ContentView.swift
//  LearningVision
//
//  Created by Andini Malavika on 17/05/24.
//

import SwiftUI

struct ContentView: View {
    @State private var ShowScannerSheet = false
    @State private var texts: [ScanData] = []
    var body: some View {
        NavigationView {
            VStack {
                if texts.count > 0 {
                    List {
                        ForEach(texts) {text in
                          NavigationLink(
                            destination:ScrollView{Text(text.content)},
                            label: {
                                Text(text.content).lineLimit(1)
                                
                            })
                            
                        }
                        
                    }
                    
                }
                else {
                    Text("No Scan Yet").font(.title2)
                    
                }
            }
            .navigationTitle("Scan OCR")
            .navigationBarItems(trailing:
                Button(action: {self.ShowScannerSheet = true}, label: {
                Image(systemName:
                        "doc.text.viewfinder")
                .font(.title)
                
            })
                    .sheet(isPresented: $ShowScannerSheet, content: { 
                        makeScannerView()
                    })
            
            )
        
        }
    }
    private func makeScannerView() -> ScannerView {
        ScannerView(completion: {
            textPerPage in
            if let outputText = textPerPage?.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines) {
                let newScanData = ScanData(content: outputText)
                self.texts.append(newScanData)
            }
            self.ShowScannerSheet = false
        })
        
    }
}

#Preview {
    ContentView()
}

                      
