//
//  oldView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 21/06/2023.
//




//MARK:  Show the textbox to enter City or Town

/*
 if showTextBox {
 VStack {
 //Link to install required Shortcut from URL
 Link("Install Shortcut", destination: URL(string: "https://www.icloud.com/shortcuts/2cbf7d164adb45fcbc6b4157a5b07d74")!)
 .shadow(radius: 3)
 .tint(.white)
 .padding()
 .background(.ultraThinMaterial)
 .clipShape(RoundedRectangle(cornerRadius: 10))
 .offset(y: -100)
 .shadow(radius: 3)
 
 HStack {
 //Text field box to enter town or city
 TextField("Enter City or Town", text: $currentCity, onCommit: {
 showTextBox = false
 fetchWeatherData() // Call fetchWeatherData here
 })
 .font(.headline)
 .textFieldStyle(RoundedBorderTextFieldStyle())
 .padding(-3)
 .frame(width: UIScreen.main.bounds.width * 0.6)
 
 //Adds Xmark to clear text box
 if !currentCity.isEmpty {
 Button(action: {
 currentCity = ""
 }) {
 Image(systemName: "xmark.circle.fill")
 .font(.title)
 .foregroundColor(.gray)
 }
 .padding(.trailing, -3)
 }
 }
 .padding(8)
 .background(Color.black.opacity(0.3))
 .cornerRadius(10)
 .shadow(radius: 3)
 .frame(width: UIScreen.main.bounds.width * 0.6)
 }
 }
 */

/*
    Group {
    Text("\(batteryViewModel.batteryLevel)%")
    .font(.title2.weight(.black))
    .foregroundColor(.white.opacity(0.75))
    .offset(x: 50, y: -76)
    .shadow(radius: 3)
    
    Image("SWA_Widgy")
    .resizable()
    .aspectRatio(contentMode: .fit)
    
    if let min = minTemp, let temp = currentTemp, let max = maxTemp {
    HStack {
    Text("\(String(format: "%.0f", kelvinToCelsius(min)))°C")
    .font(.footnote.weight(.heavy))
    .foregroundColor(.white.opacity(0.2))
    
    Text("\(String(format: "%.0f", kelvinToCelsius(temp)))°C")
    .font(.title2.weight(.black))
    .foregroundColor(Color("FFA500"))
    .padding(10)
    
    Text("\(String(format: "%.0f", kelvinToCelsius(max)))°C")
    .font(.footnote.weight(.heavy))
    .foregroundColor(.white.opacity(0.2))
    }
    .offset(x: -60)
    }
    
    Text(currentDate)
    .font(.headline.weight(.black))
    .foregroundColor(.white.opacity(0.8))
    .offset(x: -55, y: -42)
    .shadow(radius: 3)
    
    Image("SWA_Widgy_overlay")
    .resizable()
    .aspectRatio(contentMode: .fit)
    
    BatteryBar(barWidth: 150, barHeight: 4, batteryLevel: CGFloat(batteryViewModel.batteryLevel), batteryBarBackgroundColour: .gray.opacity(0.4), batteryBarColourleading: .black, batteryBarColourTrailing: .white.opacity(0.4))
    .offset(x: -55, y: 27)
    
    HStack {
    Spacer()
    
    Text("\(batteryViewModel.batteryStateDescription)")
    .font(.system(size: 8).weight(.heavy))
    .foregroundColor(.white.opacity(0.2))
    .offset(x: -50, y: 42)
    }
    .frame(width: 150)
    
    if let condition = condition {
    Image(uiImage: weatherSymbol(for: condition))
    .resizable()
    .aspectRatio(contentMode: .fit)
    .frame(width: 100, height: 100)
    .offset(x: 120, y: -5)
    .shadow(radius: 3)
    }
    }
    */

//                            Image(systemName: weatherKitManager.symbol)
//                                .font(.system(size: 50))
//                                .padding(.bottom)
