# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "yoshida/version"

Gem::Specification.new do |s|
  s.name        = "yoshida"
  s.version     = Yoshida::VERSION
  s.authors     = ["Kichiro IKEMOTO"]
  s.email       = ["kichiro@yomukaku.net"]
  s.homepage    = ""
  s.summary = %q{Yoshida（吉田）は徒然草から任意の長さの文や単語を出力するテストデータ作成のためのgemです。}
  s.description = %q{Yoshida（吉田）は徒然草から任意の長さの文や単語を出力するテストデータ作成のためのgemです。RakeやThorと合わせてテスト等に使用することができます。}

  s.rubyforge_project = "yoshida"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
