/// Interface class to act as a base for any class that is
/// to take the role of the BaseView in the Model-BaseView-Presenter pattern.
abstract class BaseView<BasePresenter> {
  void setPresenter(presenter);
}