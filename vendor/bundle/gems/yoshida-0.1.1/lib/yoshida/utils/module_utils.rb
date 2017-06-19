require 'yoshida/utils/array_utils'

module Yoshida
  module ModuleUtils
    def k(arg)
      Yoshida::ArrayUtils.const_array(arg)
    end
  end
end