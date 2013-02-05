class CenterViewController < DebugViewController

  def viewDidLoad
    super
    
    self.view.backgroundColor = UIColor.blueColor
    
    label = UILabel.alloc.init
    label.font = UIFont.boldSystemFontOfSize(20.0)
    label.textColor = UIColor.whiteColor
    label.backgroundColor = UIColor.clearColor
    label.text = "Center Panel"
    label.sizeToFit
    label.center = CGPointMake(view.bounds.size.width / 2.0, (view.bounds.size.height - navigationController.navigationBar.frame.size.height) / 2.0)
    label.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin
    self.view.addSubview(label)
  end


end