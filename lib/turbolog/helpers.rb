module Turbolog
  module Color
    def Color.red(mytext) 
      "\e[31m#{mytext}\e[0m".center(40)
    end

    def Color.blue(mytext)
      "\e[34m#{mytext}\e[0m".center(40)
    end
  end
end