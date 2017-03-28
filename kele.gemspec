Gem::Specification.new do |s|
  s.name        = 'kele'
  s.version     = '0'
  s.date        = '2017-03-24'
  s.summary     = "Kele API Client"
  s.description = "A client for the bloc API"
  s.authors     = ["Charles Fenwick Elliott"]
  s.email       = 'charles@fenwickelliott.io'
  s.files       = ['lib/kele.rb', 'lib/roadmap.rb']
  s.homepage    =
    'http://rubygems.org/gems/kele'
  s.license       = 'MIT'
  s.add_runtime_dependency 'rest-client', '~> 2'
  s.add_runtime_dependency 'json', '~> 2'
end
