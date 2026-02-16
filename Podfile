platform :ios,'11.0'
use_frameworks!

def shared_pods

pod 'SideMenu'
pod 'DataStoreKit', :git => 'http://github.com/poolmyride/DataStoreKit.git', :tag=> '3.0.5'
pod 'ReachabilitySwift'
pod 'SwiftLoader'
pod 'GoogleMaps'
pod 'GooglePlaces'
end

target 'iTrack' do
	shared_pods
end

target 'iTrackTests' do
	shared_pods
end

target 'iTrackUITests' do
	shared_pods
end
