- After coloning, please navigate to project dir in terminal and use "pod install" command to install pods
--------------------------------
*Design decisions
- i preffer the simple implementation of design so, I've made the radio button with just a button and an image for each state of it
- Alamofire is a powerfull library for networking, it also has Object-Mapper for mapping network calls results, that's why i used it
- UILabels has a problem with long text, so i used UITextViews instead because it has scrolling ability that let text go for multiple lines without any problems and it takes a little portion of the UI
------------------------------------
* suggestiuon
- Data returned is enormous and that's why you may notice a little slow performance when home screen is being loaded, "pagination" is a good considration for this issue
