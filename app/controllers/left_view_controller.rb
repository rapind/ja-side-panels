class LeftViewController < DebugViewController
  
  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.redColor

    @label = UILabel.alloc.init
    @label.font = UIFont.boldSystemFontOfSize(20.0)
    @label.textColor = UIColor.whiteColor
    @label.backgroundColor = UIColor.clearColor
    @label.text = "Left Panel"
    @label.sizeToFit
    @label.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin
    self.view.addSubview(@label)
    
    @hide = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @hide.frame = CGRectMake(20.0, 20.0, 200.0, 40.0)
    @hide.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin
    @hide.setTitle("Hide Center", forState: UIControlStateNormal)
    @hide.addTarget(self, action: '_hideTapped:', forControlEvents: UIControlEventTouchUpInside)
    self.view.addSubview(@hide)
        
    @show = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @show.frame = @hide.frame
    @show.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin
    @show.setTitle("Show Center", forState:UIControlStateNormal)
    @show.addTarget(self, action: '_showTapped:', forControlEvents: UIControlEventTouchUpInside)
    @show.hidden = true
    self.view.addSubview(@show)
    
    @removeRightPanel = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @removeRightPanel.frame = CGRectMake(20.0, 70.0, 200.0, 40.0)
    @removeRightPanel.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin
    @removeRightPanel.setTitle("Remove Right Panel", forState: UIControlStateNormal)
    @removeRightPanel.addTarget(self, action: '_removeRightPanelTapped:', forControlEvents: UIControlEventTouchUpInside)
    self.view.addSubview(@removeRightPanel)
        
    @addRightPanel = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @addRightPanel.frame = @removeRightPanel.frame
    @addRightPanel.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin
    @addRightPanel.setTitle("Add Right Panel", forState: UIControlStateNormal)
    @addRightPanel.addTarget(self, action: '_addRightPanelTapped:', forControlEvents: UIControlEventTouchUpInside)
    @addRightPanel.hidden = true
    self.view.addSubview(@addRightPanel)
  end

  def viewWillAppear(animated)
    super
    @label.center = CGPointMake(sidePanelController.leftVisibleWidth / 2.0, view.bounds.size.height / 2.0)
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

  def _removeRightPanelTapped(sender)
    self.sidePanelController.rightPanel = nil
    @removeRightPanel.hidden = true
    @addRightPanel.hidden = false
  end

  def _addRightPanelTapped(sender)
    self.sidePanelController.rightPanel = RightViewController.alloc.init
    @removeRightPanel.hidden = false
    @addRightPanel.hidden = true
  end

end