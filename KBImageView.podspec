Pod::Spec.new do |s|
  s.name         = "KBImageView"
  s.version      = "0.0.3"
  s.summary      = "UIImageView with Ken Burns effect."
  s.homepage     = "https://github.com/spromicky/KBImageView"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "spromicky" => "spromicky@gmail.com" }
  s.source       = { :git => "https://github.com/spromicky/KBImageView.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'KBView/Source/KBImageView/*'
end
