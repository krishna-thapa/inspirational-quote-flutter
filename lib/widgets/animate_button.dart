import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Source: https://pub.dev/packages/favorite_button

class AnimateButton extends StatefulWidget {
  AnimateButton({
    double iconSize,
    Color iconStartColor,
    Color iconColor,
    bool isFavorite,
    IconData iconToAdd,
    @required Function valueChanged,
    Key key,
  })  : _iconSize = iconSize ?? 70.0,
        _iconStartColor = iconStartColor ?? Colors.black12,
        _iconColor = iconColor ?? Colors.black,
        _isFavorite = isFavorite ?? false,
        _iconToAdd = iconToAdd ?? Icons.favorite,
        _valueChanged = valueChanged,
        super(key: key);

  final double _iconSize;
  final Color _iconStartColor;
  final Color _iconColor;
  final bool _isFavorite;
  final IconData _iconToAdd;
  final Function _valueChanged;

  @override
  _AnimateButtonState createState() => _AnimateButtonState();
}

class _AnimateButtonState extends State<AnimateButton>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Color> _colorAnimation;
  Animation<double> _sizeAnimation;

  CurvedAnimation _curve;

  double _maxIconSize = 0.0;
  double _minIconSize = 0.0;

  final int _animationTime = 400;

  bool _isFavorite = false;
  bool _isAnimationCompleted = false;

  @override
  void initState() {
    super.initState();

    _isFavorite = widget._isFavorite;
    _maxIconSize = (widget._iconSize < 20.0)
        ? 20.0
        : (widget._iconSize > 100.0) ? 100.0 : widget._iconSize;
    final double _sizeDifference = _maxIconSize * 0.30;
    _minIconSize = _maxIconSize - _sizeDifference;

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: _animationTime),
    );

    _curve = CurvedAnimation(curve: Curves.slowMiddle, parent: _controller);
    Animation<Color> _selectedColorAnimation = ColorTween(
      begin: widget._iconColor,
      end: widget._iconStartColor,
    ).animate(_curve);

    Animation<Color> _deSelectedColorAnimation = ColorTween(
      begin: widget._iconStartColor,
      end: widget._iconColor,
    ).animate(_curve);

    _colorAnimation = (_isFavorite == true)
        ? _selectedColorAnimation
        : _deSelectedColorAnimation;
    _sizeAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: _minIconSize,
            end: _maxIconSize,
          ),
          weight: 50,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: _maxIconSize,
            end: _minIconSize,
          ),
          weight: 50,
        ),
      ],
    ).animate(_curve);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _isAnimationCompleted = true;
        _isFavorite = !_isFavorite;
        widget._valueChanged(_isFavorite);
      } else if (status == AnimationStatus.dismissed) {
        _isAnimationCompleted = false;
        _isFavorite = !_isFavorite;
        widget._valueChanged(_isFavorite);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, _) {
        return InkResponse(
          onTap: () {
            setState(() {
              _isAnimationCompleted
                  ? _controller.reverse()
                  : _controller.forward();
            });
          },
          child: Icon(
            (widget._iconToAdd),
            color: _colorAnimation.value,
            size: _sizeAnimation.value,
          ),
        );
      },
    );
  }
}
