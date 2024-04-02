# CodingTest - 
This is the coding test to demonstrate the showcase about SwiftUI. In this coding , I have used publicy available API (https://s3.amazonaws.com/sq-mobile-interview/employees.json) which contains employee data with properties like Name, Phone Number, Team etc. In this test , I have tried to cover following requirment as it stated into PDF (SOLID principles, Code Architecture, Modular, SwiftUI, Unit tests).

* **Architecture:** For this example, I have followed the MVVM (View - Model - ViewModel). The view contains only code which is related to view. The model contains code only for json code/decodable objects. The viewModel constains only code for which is related to business logic. The seperation of the code and logic  help to write require unit test / UI test case. The MVVM is the most recommend architecture design compare to tradition architecture design pattern. The MVVM architectural design pattern also help to write the clean code, which increase the simplicity, readability, testability of the code.  

* **SOLID principles:** I have followed the SOLID principles . I have given single responsibility of the each class and separate the interfcae and protocol of the each class to mkae sure the code is not tightly couped. In addition , I have given seperate layer for handling json parsing (Repository layer).

* **Presentation Layer:** To design presentation layer, I have used the SwiftUI with Combine approach. The SwiftUI and combine is the most recommended way to desin the code and render the views. In UIkit , we have heavily depend on protocol delegate and class. Because of the inheritance , there were lots of unnecessarily code is added , which impact the performances of the app. We also needs to take care the memory leaks as well. But SwiftUI depeneds on values types (struct), for that reason there is no memory leaks and combine works on publisher and subscriber principal. This ensure the latest update of the view but it was not possible UIkit.

* **Concurrency and Performance:** In this coding test, I have used the async and await to handle te concurrency. The async and await is also known as structured concurrency. It is the most recommend way to hande the concurrency rather then closure with completion block. The SwiftUI works on properties wrapper like @State, @Observed, @ObserbaleObjest which and combine which help to achieve the highest performance of the App.

* **Simplicity and Readability:** Because of the async and await the code is very easy to understand. The async and await is help to write the less code which increase the readability of the code. Also help us to write batter unit test.
