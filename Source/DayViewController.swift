import UIKit
import DateToolsSwift

open class DayViewController: UIViewController, EventDataSource, DayViewDelegate {
  public lazy var dayView: DayView = DayView()
  public var dataSource: EventDataSource? {
    get {
      return dayView.dataSource
    }
    set(value) {
      dayView.dataSource = value
    }
  }

  public var delegate: DayViewDelegate? {
    get {
      return dayView.delegate
    }
    set(value) {
      dayView.delegate = value
    }
  }

  public var calendar = Calendar.autoupdatingCurrent {
    didSet {
      dayView.calendar = calendar
    }
  }

  open override func loadView() {
    view = dayView
  }

  override open func viewDidLoad() {
    super.viewDidLoad()
    edgesForExtendedLayout = []
    view.tintColor = UIColor.red
    dataSource = self
    delegate = self
    dayView.reloadData()

    let sizeClass = traitCollection.horizontalSizeClass
    configureDayViewLayoutForHorizontalSizeClass(sizeClass)
  }

  open override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    dayView.scrollToFirstEventIfNeeded()
  }

  open override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
    super.willTransition(to: newCollection, with: coordinator)
    configureDayViewLayoutForHorizontalSizeClass(newCollection.horizontalSizeClass)
  }

  func configureDayViewLayoutForHorizontalSizeClass(_ sizeClass: UIUserInterfaceSizeClass) {
    dayView.transitionToHorizontalSizeClass(sizeClass)
  }

  open func reloadData() {
    dayView.reloadData()
  }

  open func updateStyle(_ newStyle: CalendarStyle) {
    dayView.updateStyle(newStyle)
  }

  open func eventsForDate(_ date: Date) -> [EventDescriptor] {
    return [Event]()
  }

  // MARK: DayViewDelegate

  open func dayViewDidSelectEventView(_ eventView: EventView) {
  }

  open func dayViewDidLongPressEventView(_ eventView: EventView) {
  }

  open func dayViewDidLongPressTimelineAtHour(_ hour: Int, minute: Int) {
  }
  
  open func dayViewDidTapTimelineAtHour(_ hour: Int, minute: Int) {
  }

  open func dayView(dayView: DayView, willMoveTo date: Date) {
  }

  open func dayView(dayView: DayView, didMoveTo date: Date) {
  }
}
