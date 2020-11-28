class HomeController < ApplicationController
    layout "blog" #ici qu"on met le layout Administration ou blog selon ce qu'on veut
    def index
        @posts = Post.where(published: true).order(created_at: :DESC).limit(5)
    end
end
