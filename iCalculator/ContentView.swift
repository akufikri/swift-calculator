import SwiftUI

struct ContentView: View {
    
        @State private var displayText = ""
        @State private var currentNumber = ""
        @State private var storedNumber = ""
        @State private var operation: String?
    
    var body: some View {
        VStack{
            HStack{
                TextField("", text: $displayText)
                    .frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                    .padding()
            }
            HStack{
                Button(action: {
                    if let current = Double(currentNumber){
                        let percentValue  = current / 100
                        displayText = String(percentValue)
                        resetCurrentNumber()
                    }
                }, label: {
                    Image(systemName: "percent")
                })
                .frame(width: 80, height: 80)
                .background(Color.gray.opacity(10))
                .foregroundColor(.white)
                .cornerRadius(100)
                
                Button(action: {
                    operation = "*"
                    performOperation()
                }, label: {
                    Image(systemName: "xmark")
                })
                .frame(width: 80, height: 80)
                .background(Color.gray.opacity(10))
                .foregroundColor(.white)
                .cornerRadius(100)
                
                Button(action: {
                    operation = "/"
                    performOperation()
                }, label: {
                    Image(systemName: "divide")
                })
                .frame(width: 80, height: 80)
                .background(Color.gray.opacity(10))
                .foregroundColor(.white)
                .cornerRadius(100)
                
                Button(action: {
                   resetCurrentNumber()
                }, label: {
                    Image(systemName: "delete.left")
                })
                .frame(width: 80, height: 80)
                .background(Color.yellow)
                .foregroundColor(.white)
                .cornerRadius(100)
                
            }
            HStack{
                Button(action: {
                    updateCurrentNumber(with: "7")
                }, label: {
                   Text("7")
                })
                .frame(width: 80, height: 80)
                .background(Color.blackeds)
                .foregroundColor(.white)
                .cornerRadius(100)
                
                Button(action: {
                    updateCurrentNumber(with: "8")
                }, label: {
                   Text("8")
                })
                .frame(width: 80, height: 80)
                .background(Color.blackeds)
                .foregroundColor(.white)
                .cornerRadius(100)
                
                Button(action: {
                    updateCurrentNumber(with: "9")
                }, label: {
                   Text("9")
                })
                .frame(width: 80, height: 80)
                .background(Color.blackeds)
                .foregroundColor(.white)
                .cornerRadius(100)
                
                Button(action: {
                    operation = "-"
                    performOperation()
                }, label: {
                    Image(systemName: "minus")
                })
                .frame(width: 80, height: 80)
                .background(Color.yellow)
                .foregroundColor(.white)
                .cornerRadius(100)
                
            }
            HStack{
                Button(action: {
                    updateCurrentNumber(with: "4")
                }, label: {
                   Text("4")
                })
                .frame(width: 80, height: 80)
                .background(Color.blackeds)
                .foregroundColor(.white)
                .cornerRadius(100)
                
                Button(action: {
                    updateCurrentNumber(with: "5")
                }, label: {
                   Text("5")
                })
                .frame(width: 80, height: 80)
                .background(Color.blackeds)
                .foregroundColor(.white)
                .cornerRadius(100)
                
                Button(action: {
                    updateCurrentNumber(with: "6")
                }, label: {
                   Text("6")
                })
                .frame(width: 80, height: 80)
                .background(Color.blackeds)
                .foregroundColor(.white)
                .cornerRadius(100)
                
                Button(action: {
                    operation = "+"
                    performOperation()
                }, label: {
                    Image(systemName: "plus")
                })
                .frame(width: 80, height: 80)
                .background(Color.yellow)
                .foregroundColor(.white)
                .cornerRadius(100)
                
            }
            HStack{
                VStack(spacing:10){
                    HStack{
                        Button(action: {
                            updateCurrentNumber(with: "1")
                        }, label: {
                           Text("1")
                        })
                        .frame(width: 80, height: 80)
                        .background(Color.blackeds)
                        .foregroundColor(.white)
                        .cornerRadius(100)
                        
                        Button(action: {
                            updateCurrentNumber(with: "2")
                        }, label: {
                           Text("2")
                        })
                        .frame(width: 80, height: 80)
                        .background(Color.blackeds)
                        .foregroundColor(.white)
                        .cornerRadius(100)
                        
                        Button(action: {
                            updateCurrentNumber(with: "3")
                        }, label: {
                           Text("3")
                        })
                        .frame(width: 80, height: 80)
                        .background(Color.blackeds)
                        .foregroundColor(.white)
                        .cornerRadius(100)
                    
                        
                    }
                  
                    
                    HStack{
                        Button(action: {resetCalc()}, label: {
                           Text("AC")
                        })
                        .frame(width: 80, height: 80)
                        .background(Color.blackeds)
                        .foregroundColor(.white)
                        .cornerRadius(100)
                        
                        Button(action: {
                            updateCurrentNumber(with: "0")
                        }, label: {
                           Text("0")
                        })
                        .frame(width: 80, height: 80)
                        .background(Color.blackeds)
                        .foregroundColor(.white)
                        .cornerRadius(100)
                        
                        Button(action: {
                            updateCurrentNumber(with: ".")
                        }, label: {
                           Text(".")
                        })
                        .frame(width: 80, height: 80)
                        .background(Color.blackeds)
                        .foregroundColor(.white)
                        .cornerRadius(100)
                    
                        
                    }
                }
                
                
                Button(action: {calculateResult()}, label: {
                    Image(systemName: "equal")
                })
                .frame(width: 80, height: 160)
                .background(Color.yellow)
                .foregroundColor(.white)
                .cornerRadius(100)
            }
        }
    }
    
    private func updateCurrentNumber(with digit: String){
            currentNumber += digit
            displayText = currentNumber
        }
        
        private func performOperation(){
            guard let stored = Double(storedNumber), let current = Double(currentNumber) else {return}
            
            var result: Double = 0
            
            switch operation {
            case "+": result = stored + current
            case "-": result = stored - current
            case "*": result = stored * current
            case "/": result = stored / current
            default:break
            }
            
            displayText = String(result)
            resetCurrentNumber()
        }
        
        private func resetCurrentNumber(){
            currentNumber = ""
        }
        
        private func resetCalc(){
            displayText = ""
            currentNumber = ""
            storedNumber = ""
            operation = nil
        }
        
        private func calculateResult() {
            storedNumber = displayText
            performOperation()
            operation = nil
        }
    }


#Preview {
    ContentView()
}
