Pod::Spec.new do |spec|
  spec.name             = "AppleTrace"                         
  spec.version          = "1.0"                                     
  spec.summary          = "AppleTrace for MonkeyDev"
  spec.description      = <<-DESC                                     
                          - AppleTrace for MonkeyDev
                        DESC

  spec.homepage         = "https://github.com/everettjf/AppleTrace"  

  spec.license          = { :type => "BSD", :file => "LICENSE" }          
  spec.author           = { "everettjf" => "everettjf@live.com" }
  spec.social_media_url = "http://weibo.com/everettjf"
  spec.platform         = :ios, "8.0"
  spec.source           = { :git => "https://github.com/zylcold/AppleTrace/new/master", :tag => spec.version.to_s }  
  spec.source_files     = [
    "appletrace/appletrace/src/**/*.{h,m,c,a}",
    "appletrace/appletrace/src/**/*.mm",
    ]
  spec.public_header_files = [
    "appletrace/appletrace/src/appletrace.h"
    ]
  spec.requires_arc     = true
  spec.pod_target_xcconfig = { 
    'VALID_ARCHS' => 'arm64',
    "ONLY_ACTIVE_ARCH" => "Yes" ,
    "OTHER_LDFLAGS" => "-L'$(PODS_ROOT)/AppleTrace/appletrace/appletrace/src/objc/hookZz/deps/capstone/' -lcapstone.arm64",
    "ENABLE_BITCODE" => "No",
    }     

  non_arc_files = [
    "appletrace/appletrace/src/objc/hook_objc_msgSend.m"
    ]
  spec.exclude_files = non_arc_files

  spec.subspec 'no-arc' do |sna|
    sna.requires_arc = false
    sna.source_files = non_arc_files
  end 
end
