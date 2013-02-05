class DebugViewController < UIViewController

  def viewWillAppear(animated)
    super
    NSLog("%@ viewWillAppear", self)
  end

  def viewDidAppear(animated)
    super
    NSLog("%@ viewDidAppear", self)
  end

  def viewWillDisappear(animated)
    super
    NSLog("%@ viewWillDisappear", self)
  end

  def viewDidDisappear(animated)
    super
    NSLog("%@ viewDidDisappear", self)
  end

  def willMoveToParentViewController(parent)
    super
    NSLog("%@ willMoveToParentViewController %@", self, parent)
  end

  def didMoveToParentViewController(parent)
    super
    NSLog("%@ didMoveToParentViewController %@", self, parent)
  end

end