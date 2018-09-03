platform :ios, '9.0'

use_frameworks!

def shared_frameworks
	pod "BrightFutures"
	pod "Result"
end

target 'GitGist' do
  pod "Swinject"
  pod "SnapKit"
end

target 'Domain' do
	shared_frameworks
end

target 'Service' do
	shared_frameworks
	
	pod "Alamofire"
end
