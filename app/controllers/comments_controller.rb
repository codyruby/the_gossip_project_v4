class CommentsController < ApplicationController
  def index
    @comment = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(:user_id => params[:user_id], :gossip_id => params[:gossip_id], :content => params[:content])
    if @comment.save
    redirect_to user_gossip_path(user_id: params[:user_id], id: params[:gossip_id])
    else
      redirect_to user_gossip_path(user_id: params[:user_id], id: params[:gossip_id])
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    p @comment
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(:content => params[:content])
      redirect_to user_gossip_path(user_id: params[:user_id], id: params[:gossip_id])
    else
      render :edit
    end
  end

   # Méthode qui permet de supprimer le commentaire 
   def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to user_gossip_path(user_id: params[:user_id], id: params[:gossip_id])
  end
end
