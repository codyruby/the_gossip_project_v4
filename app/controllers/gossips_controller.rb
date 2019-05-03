class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
    @users = User.all
    @tags = Tag.all
    @taggables = Taggable.all
  end

  def show
    @gossip = Gossip.find(params[:id])
    @user = User.find(params[:user_id])
    @city = City.find(@user.city_id)
    # @comments = Comment.select { |comment| comment.gossip_id==params[:id]}
    @comments = Comment.all
    @comments_by_gossip_id = @comments.where(gossip_id: params[:id]).ids
    @tags = Tag.all
  end

   # Méthode qui permet de créer un nouveau gossip
   def new
    @gossip = Gossip.new
    @tags = Tag.all
    @tags_title = @tags.map { |tag| tag.title}
  end

  # Méthode qui permet de créer un nouveau gossip avec les params récupéré dans le formulaire de la vue new de gossip
  def create
    @gossip = Gossip.new(:user_id => params[:user_id], :title => params[:title], :content => params[:content])
    if @gossip.save
      Taggable.create(tag_id: params[:tag_id], gossip_id: @gossip.id)
    redirect_to root_path
    else
    render 'new'
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
    @tags = Tag.all
    @tags_title = @tags.map { |tag| tag.title}
  end

  def update
    @gossip = Gossip.find(params[:id])
    
    if @gossip.update(:title => params[:title], :content => params[:content]) 

      Taggable.update(tag_id: params[:tag_id], gossip_id: @gossip.id)

      redirect_to root_path
    elsif Taggable.where(gossip_id: params[:id]).blank? == false
       
        Taggable.create(tag_id: params[:tag_id], gossip_id: @gossip.id)
  
        redirect_to root_path
    else
      render :edit
    end
  end

  # Méthode qui permet de supprimer le gossip 
  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to root_path
  end

end
