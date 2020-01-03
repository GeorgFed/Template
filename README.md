# Swift Project Template

This is a template project for Swift development. Swift Project Template consists of the most useful extensions for mobile development. In addition, it includes style guidelines to make your project more consistant. Feel free to contribute and extend the functionality of the template. 

## Getting Started

To use this repository as a template, click "Use this template" button above the file list. After you click the button, select your Github account and create a new repo. 

To explore the template, see the UIViewController files: ExampleVC and DashboardVC.
NOTE: Before you begin developing your own project, delete these UIViewController files. 

### Structure
Swift Project Template follows traditional MVC scheme with a few additional components. 
- Extensions
- Services
- Helpers
- Models
- Views
- Controllers
- XIBs

Explore the Extensions and Helpers folder: there you can see the key components for mobile development. The former consist of standart library class extensions with additional function. Helpers include custom classe, such as CustomView, CustomButton and CustomTextField. You can use them instead of traditional ones, as they also inherit all their base properties. 

### Guidelines

These are the guidelines for consistant app development with Swift Project Template. 

#### Setup

First of all, you need to setup your app's style and constants. Go to the Constants file and add change UIColor extension according to your need. 
NOTE: It is highly recommended to only use 3-4 colors in your app. Each color should be attributed to specific UI element for better UX.

The same applies to your app's typography. Define the fonts and their attributes in the Constants file. If you want to add new TextAttributes, go to Style - TextAttributes struct and edit the properties. 

Finally, to customize your app's full appearence you need to edit the myApp static property. Here you can set UIViewController background color and status bar style. To change text attributes, go to myAppAttributes and change attributes for each text style from TextStyle enumeration. 

#### Style Application
Apply style to UI elements, such as UITextField, UILabel and UIButton. 

```
style.apply(textStyle: .title, to: titleLabel)
style.apply(textStyle: .body, to: textField)
style.apply(to: mainButton)
```

Apply style to UINavigationBar.
```
if let navigationBar = navigationController?.navigationBar {
    style.apply(to: navigationBar)
}
```

Apply style to UIStatusBar.
```
override var preferredStatusBarStyle: UIStatusBarStyle {
    return style.preferredStatusBarStyle
}
```

## Contribute

Extend the template by adding new helpers and extensions. Share your resources and promote Swift Template Project. 

### Contribution suggestions
1. Add useful helpers and extensions
2. Add convenient style settings
3. Update code to the latest Swift versions

### Contribution rules
1. Do not add any external dependancies 
2. Update README after you add changes
3. Do not forget to add comments where needed 
4. Refer to the original authors of code

## Authors

* **Egor Fedyaev - https://github.com/GeorgFed – Swift Template Project creator

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments
...

