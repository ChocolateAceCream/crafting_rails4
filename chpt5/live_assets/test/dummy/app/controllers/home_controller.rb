#---
# Excerpted from "Crafting Rails 4 Applications",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/jvrails2 for more book information.
#---
class HomeController < ApplicationController
  def index
    render html: '<strong>HTML</strong>',  layout: true, steam: true
  end
end
