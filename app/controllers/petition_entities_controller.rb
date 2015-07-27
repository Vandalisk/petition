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

    if @petition_entity.save
      redirect_to @petition_entity
    else
      render action: 'edit'
    end
  end

  def petition_entity_params
    params.require(:petition_entity).permit(:title, :description)
  end
end
