# KBImageView

`UIImageView` subclass that can change images with Ken Burns effect. This image view is good for some kind of landing page or for unusual backgrounds.

![](example.gif)

All images from [Unsplash](https://unsplash.com).

## Usage

To support `KBImageView` in your application you must set `delegate` for it. This delegate must confirm to protocol `KBImageViewDelegate`. And implement two required methods: 

- `numberOfImagesInImageView:` - must return number of all images in slide show. Called every time before image going to changed.
- `imageView:imageForIndex:` - must return image for current index. Also called every time before image going to changed.

`KBImageView` does not stores all image, that was presented before. Just only one current image.

## Installation

### CocoaPods

Add `pod 'KBImageView'` to your Podfile. 

### Manual Installation

Just copy `KBImageView` class to your project.

## Requirements

- Xcode 7.0
- iOS 7.0+

## License

KBImageView is available under the MIT license. See the LICENSE file for more info.

