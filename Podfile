source 'https://github.com/Carota-MarketPlanner/Specs.git'

platform :ios, '15.0'
use_frameworks!

def common
  pod 'NetCore', '1.3.2'
  pod 'CDSComponents', '1.3.0'
  pod 'CarotaTheme', '1.3.0'
end

target 'Carota' do
  common

  target 'CarotaTests' do
    inherit! :search_paths
  end

  target 'CarotaUITests' do
  end
end
