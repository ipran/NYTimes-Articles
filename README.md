# NYTimes-Articles

NYTimes-Articles is an iOS app written in Swift language (Swift 5.0)
Xcode IDE version used for developing this app is Xcode Version 11.2.1

About
NYTimes-Articles is Master-detail application, in which the first/main view will show the most popular articles published by NewYork Times, If user wants to read that article he/she can click on that article from the list of article and the app will take them to the detail view, where they can read the article completely.

The app uses a single REST API for fethcing data from the server. For accessing the server user need to provide an API Key that he/she will get from the NewYork Times API portal after registration.

The Design pattern/Architecture used for this iOS app is 'MVC' architecture. Unit tests for API as well as UI are written and the app is having a good code coverage of 73.5%.

NYTimes-Article is a universal iOS app which runs in iPhone/iPad in portrait as well as in landscpe mode.

Installation
Clone the repository, "https://github.com/ipran/NYTimes-Articles.git" , from a Mac OS
Go inside the project folder, and open "NYTimes-Articles.xcworkspace"
It will open the Xcode with 'NYTimes-Articles' project
If the Xcode display nothing or showing some error message, go to terminal and cd to project folder and type "pod install", this will install the third party libraries used in the app. 
(Only one thrid party library is used for this app - Kingfisher)
Open "NYTimes-Articles.xcworkspace" again from the project folder select the simulator and click run button.

Unit Testing and Code Coverage
Open the project in Xcode, In the left side Navigator you can see lot of options to select. Click the 6th menu which is the 'Show The Test Navigator Menu' (Or Command+6 will open the same menu).
You can see a folder with name 'NYTimes-ArticleTests 10 tests', when you click on that you can able to see a play button in the right side.
When you click on the play button system will start testing the 10 test cases. It will all the test cases result in that section itself.
To know the code coverage of 'NYTimes-Article' app, first you need to go Product Menu of Xcode and select Scheme from there.
From Schema click Edit Schema, it will open a new window with lot of menus.
In Edit Schema from the left side you choose option 'Test Debug' and from the right side top menus, choose the 'Options' menu.
Here you can see Code Coverage and if the tick mark near the Code Coverage is not selected please select it, and you have options to choose targets for test coverage, you can either choose 'some Targets' or 'all targets'. From Here choose 'some targets' and click on the plus button below the Targets option and choose 'NYTimes-Atricles'. Once you done this close the window.
Again go to Test NAvigator menu (You can simply do this by command + 6) and press the play button for testing the all test cases. Once you run all the test cases now you click 'command + 9' to open Report Navigator (You can reach this menu by directly selecting the last menu from Navigator). 
In the Report Navigator you can see 2 options: 'NYTimes-Articles' app and 'Workspace'. Expand 'NYTimes-Articles' app and expand 'Test' from there and you can see the 'Coverage' options from there.
Click on the 'Coverage' then in the right side windo you can able to see the test coverage result.
