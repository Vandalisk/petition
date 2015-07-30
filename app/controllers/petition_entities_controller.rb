class PetitionEntitiesController < ApplicationController
  def index
    @petition_entities = PetitionEntity.all
  end

  def show
    @petition_entity = PetitionEntity.find(params[:id])
  end

  def new
    @petition_entity = PetitionEntity.new
  end

  def edit
  end

  def create
    @petition_entity = PetitionEntity.new(petition_entity_params)
    @petition_entity.user = current_user

    if @petition_entity.save
      redirect_to @petition_entity
    else
      render action: 'edit'
    end
  end

  def subscribe_petition
    @petition_entity = PetitionEntity.find(params[:id])
    @petition_entity.votes << current_user.fio
    @petition_entity.save!
    flash[:success] = "You successfully voted"
    redirect_to petition_entities_path
  end

  def destroy
    PetitionEntity.find(params[:id]).destroy
    flash[:success] = "Petition deleted"
    redirect_to petition_entities_path
  end

  def petition_entity_params
    params.require(:petition_entity).permit(:title, :description, :votes, :user)
  end
end
