# CodingTest - 
This is the coding test to demonstrate the showcase about SwiftUI. In this coding , I have used publicy available API (https://s3.amazonaws.com/sq-mobile-interview/employees.json) which contains employee data with properties like Name, Phone Number, Team etc. In this test , I have tried to cover following requirment as it stated into PDF ( SOLID principles, Code Architecture, Modular, SwiftUI, Unit tests).

* **Architecture:** For this example, I have followed the MVVM (View - Model - ViewModel). The view contains only code which is related to view. The model contains code only for json code/decodeable objects. The viewModel constains only code for which is related to business logic. The seperation of the code and logic  help to write require unit test / UI test case.  
