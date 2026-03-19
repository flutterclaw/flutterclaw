Pod::Spec.new do |s|
  s.name         = 'C2WNet'
  s.version      = '0.2.0'
  s.summary      = 'wazero WASM runtime + gvisor-tap-vsock network stack for iOS sandbox'
  s.homepage     = 'https://github.com/flutterclaw/flutterclaw'
  s.license      = { :type => 'Apache-2.0' }
  s.author       = 'FlutterClaw'
  s.source       = { :path => '.' }
  s.vendored_frameworks = 'C2WNet/C2WNet.xcframework'
  s.ios.deployment_target = '14.0'
  # Go runtime requires libresolv for DNS (res_9_ninit, res_9_nsearch, res_9_nclose).
  s.libraries = 'resolv'
end
