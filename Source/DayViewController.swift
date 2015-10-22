import UIKit

public class DayViewController: UIViewController {

  lazy var dayView: DayView = DayView()

  override public func viewDidLoad() {
    super.viewDidLoad()
    self.edgesForExtendedLayout = UIRectEdge.None
    view.addSubview(dayView)
    view.tintColor = UIColor.redColor()
  }

  public override func viewDidLayoutSubviews() {
    dayView.fillSuperview()
  }
}