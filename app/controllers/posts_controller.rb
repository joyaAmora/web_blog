class PostsController < ApplicationController
    layout "administration"
    before_action :authenticate_member!

    def index
        @posts = current_member.posts
        respond_to do |format|
          format.html
          format.json { render :json => @posts.to_json }
          format.xml { render :xml => @posts.as_json.to_xml }
        end
    end

    def show
      @post = current_member.posts.find(params[:id])
      respond_to do |format|
        format.html
        format.json { render :json => @post.to_json }
        format.xml { render :xml => @post.as_json.to_xml }
      end
    end

    def new
        @post = Post.new
    end

    def publish
      @post = current_member.posts.find(params[:id])
      @post.update(published: true)
      redirect_to posts_path
    end

    def unpublish
      @post = current_member.posts.find(params[:id])
      @post.update(published: false)
      redirect_to posts_path
    end

    def edit
        @post = current_member.posts.find(params[:id])
    end

    def create
        # Securite lors d'une assignation de masse, on filtre les paramètres authoriser avant de les envoyer au modèle qui gère la base de données
        # Voir fonction privé de ce controlleur
        #post_params = params.require(:post).permit(:title, :body)
        

        @post = current_member.posts.new(post_params)
        
        respond_to do |format|    
          if @post.save # Si la sauvegarde se passe bien, on redirige vers l'action index_5 pour rafraichir le formulaire
            format.html {redirect_to '/posts'}
          else
            format.html {render 'new' } # Si une erreur arrive, on l'affiche sur le formulaire d'origine
          end
          # Si utilisation en javascript
          format.json { render :json => @post.to_json }
          format.xml { render :xml => @post.as_json.to_xml }
        end
    end

    def update
        # Securite lors d'une assignation de masse, on filtre les paramètres authoriser avant de les envoyer au modèle qui gère la base de données
        # Voir fonction privé de ce controlleur
        #post_params = params.require(:post).permit(:title, :body)

        @post = current_member.posts.find(params[:id])        
        
        respond_to do |format|    
          if @post.update(post_params) # Si la sauvegarde se passe bien, on redirige vers l'action index_5 pour rafraichir le formulaire
            format.html {redirect_to '/posts'}
          else
            format.html {render 'edit' } # Si une erreur arrive, on l'affiche sur le formulaire d'origine
          end
          # Si utilisation en javascript
          format.json { render :json => @post.to_json }
          format.xml { render :xml => @post.as_json.to_xml }
        end
    end

    private
    def post_params
        params.require(:post).permit(:title, :body)
    end
end
