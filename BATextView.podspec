Pod::Spec.new do |s|
    s.name         = 'BATextView'
    s.version      = '1.0.1'
s.summary      = 'UITextView 的封装，可以自定义 placeholder、文字的(字体、颜色)、文字(字体、颜色)，自适应高度，实时监测输入文字的最大高度，实时监测输入文字的最大个数，可以限制最大输入文字字数'
    s.homepage     = 'https://github.com/BAHome/BATextView'
    s.license      = 'MIT'
    s.authors      = { 'boai' => 'sunboyan@outlook.com' }
    s.platform     = :ios, '7.0'
    s.source       = { :git => 'https://github.com/BAHome/BATextView.git', :tag => s.version.to_s }
    s.source_files = 'BATextView/BATextView/*.{h,m}'
    s.requires_arc = true
end
