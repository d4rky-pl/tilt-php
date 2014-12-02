# -*- encoding: utf-8 -*-
require File.dirname(__FILE__) + '/lib/tilt-php/version'
require 'date'

Gem::Specification.new do |s|
  s.name              = 'tilt-php'
  s.version           = TiltPHP::VERSION
  s.date              = Date.today.to_s
  s.authors           = ['Michał Matyas']
  s.email             = ['hello@higher.lv']
  s.summary           = 'PHP template support for Tilt.'
  s.description       = 'Why would you use any templating system when plain old PHP is enough?'
  s.homepage          = 'http://github.com/d4rky-pl/tilt-php/'
  s.license           = 'MIT'

  s.files             = `git ls-files`.split("\n")
  s.executables       = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths     = %w(lib)

  s.add_runtime_dependency('temple', ['~> 0.6.9'])
  s.add_runtime_dependency('tilt', ['>= 1.3.3', '< 2.1'])
end
