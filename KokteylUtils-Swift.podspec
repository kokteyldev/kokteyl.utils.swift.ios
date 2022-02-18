Pod::Spec.new do |s|
    s.name = 'KokteylUtils-Swift'
    s.version = '1.0.0'
    s.license = { :type => 'MIT', :text => <<-LICENSE
                Copyright 2019
                KOKTEYL Bilgi Teknolojisi Hizmetleri A.S..
                LICENSE
    }
    s.summary = 'Kokteyl Swift Utilities'
    s.homepage = 'https://github.com/kokteyldev/kokteyl.utils.swift.ios.git'
    s.authors = { 'Kokteyl' => 'info@kokteyl.com' }
    s.source = { :git => 'https://github.com/kokteyldev/kokteyl.utils.swift.ios.git', :tag => s.version }
    s.documentation_url = 'https://github.com/kokteyldev/kokteyl.utils.swift.ios.git'

    s.ios.deployment_target = '11.0'
    s.osx.deployment_target = '12.1'

    s.swift_versions = ['5.3', '5.4', '5.5']
    
    s.source_files = 'KokteylUtils/**/*.swift'
    s.frameworks = 'UIKit'
end

