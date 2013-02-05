class RightViewController < DebugViewController

  def viewDidLoad
    super
    
    self.view.backgroundColor = UIColor.greenColor
    
    @label = UILabel.alloc.init
    @label.font = UIFont.boldSystemFontOfSize(20.0)
    @label.textColor = UIColor.whiteColor
    @label.backgroundColor = UIColor.clearColor
    @label.text = "Right Panel"
    @label.sizeToFit
    @label.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin
    self.view.addSubview(@label)

    @hide = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @hide.frame = CGRectMake(view.bounds.size.width - 220.0, 20.0, 200.0, 40.0)
    @hide.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin
    @hide.setTitle("Hide Center", forState: UIControlStateNormal)
    @hide.addTarget(self, action: '_hideTapped:', forControlEvents: UIControlEventTouchUpInside)
    self.view.addSubview(@hide)
        
    @show = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @show.frame = @hide.frame
    @show.autoresizingMask = @hide.autoresizingMask
    @show.setTitle("Show Center", forState:UIControlStateNormal)
    @show.addTarget(self, action: '_showTapped:', forControlEvents: UIControlEventTouchUpInside)
    @show.hidden = true
    self.view.addSubview(@show)
  end

  def viewWillAppear(animated)
    super
    @label.center = CGPointMake((view.bounds.size.width - sidePanelController.rightVisibleWidth) + sidePanelController.rightVisibleWidth / 2.0, view.bounds.size.height / 2.0)
  end

  #pragma mark - Button Actions

  def _hideTapped(sender)
    self.sidePanelController.setCenterPanelHidden(true, animated: true, duration:0.2)
    @hide.hidden = true
    @show.hidden = false
  end

  def _showTapped(sender)
    self.sidePanelController.setCenterPanelHidden(false, animated: true, duration: 0.2)
    @hide.hidden = false
    @show.hidden = true
  end

end