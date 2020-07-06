Pod::Spec.new do |s|

  s.name                        =  "CSOddFormatters"
  s.version                     =  "1.1.1"
  s.license                     =  "MIT"

  s.summary                     =  "A collection of useful NSFormatter subclasses."

  s.homepage                    =  "https://github.com/thecatalinstan/CSOddFormatters"
  s.author                      =   { "Cătălin Stan" => "catalin.stan@me.com" }
  s.social_media_url            =   "http://twitter.com/catalinstan"

  s.source                      =  { :git => "https://github.com/thecatalinstan/CSOddFormatters.git", :tag => s.version }

  s.module_name                 = "CSOddFormatters"

  s.source_files                = "CSOddFormatters/*.{h,m}"
  s.public_header_files         = "CSOddFormatters/CSOddFormatters.h", "CSOddFormatters/CSTimeIntervalFormatter.h", "CSOddFormatters/CSLargeNumberFormatter.h"

  s.ios.deployment_target       = "8.0"
  s.ios.frameworks              = "Foundation"

  s.osx.deployment_target       = "10.10"
  s.osx.frameworks              = "Foundation"

  s.tvos.deployment_target      = "9.0"
  s.tvos.frameworks             = "Foundation"

  s.watchos.deployment_target   = "2.0"
  s.watchos.frameworks          = "Foundation"

  s.requires_arc                = true

end
