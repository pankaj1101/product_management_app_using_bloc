abstract class SliderScreenEvent {}

class SliderValue extends SliderScreenEvent {
  double sliderValue;
  SliderValue({required this.sliderValue});
}
