# SBAnimatedLoaderView
Simple Swift class that animates an UIImageView inside a UIView. A UILabel can be set as well

# Initialisation
Just copy the class into your project and call SBAnimatedLoaderView()
Example :
`
var loader = SBAnimatedLoaderView()
override func viewdidLoad() {
let width = 150 as CGFloat
let frame = CGRectMake((self.view.frame.width - width) / 2, (self.view.frame.height - width) / 2, width, width)
let LoaderbackgroundColor = UIColor.blueColor()
loader = SBAnimatedLoaderView(frame: frame, color: LoaderbackgroundColor, spriteName: "pet_", numberOfSprites: 8, animationDuration: 0.8, labelString: "Loading...", labelTextColor: UIColor.whiteColor())
self.view.addSubview(loader)
}
`
# Display the loader
loader.show()

#Dismiss the loader
loader.hide()
