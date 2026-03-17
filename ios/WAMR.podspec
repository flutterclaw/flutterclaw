Pod::Spec.new do |s|
  s.name         = 'WAMR'
  s.version      = '2.1.0'
  s.summary      = 'WebAssembly Micro Runtime — interpreter mode, no JIT, App Store safe.'
  s.description  = 'WAMR by the Bytecode Alliance. Interpreter mode only (no JIT), WASI enabled.'
  s.homepage     = 'https://github.com/bytecodealliance/wasm-micro-runtime'
  s.license      = { :type => 'Apache-2.0', :file => 'WAMR/LICENSE' }
  s.author       = { 'Bytecode Alliance' => 'https://bytecodealliance.org' }
  s.source       = { :path => '.' }
  s.ios.deployment_target = '14.0'
  s.vendored_frameworks = 'WAMR/wamr.xcframework'
end
