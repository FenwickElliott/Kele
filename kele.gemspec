Gem::Specification.new do |s|
  s.name        = 'kele'
  s.version     = '7'
  s.date        = '2017-03-24'
  s.summary     = "Kele API Client"
  s.description = "A client for the bloc API"
  s.authors     = ["Charles Fenwick Elliott"]
  s.email       = 'charles@fenwickelliott.io'
  s.files       = `git ls-files`.split($/)
  s.homepage    =
    'http://rubygems.org/gems/kele'
  s.license       = 'MIT'
  s.add_runtime_dependency 'rest-client'
  s.add_runtime_dependency 'json'
end
