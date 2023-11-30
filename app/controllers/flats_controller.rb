class FlatsController < ApplicationController
  def index
    @flats = Flat.all
  end

  def new
    @flat = Flat.new
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def update
    @flat = Flat.find(params[:id])
    if @flat.update(flat_params)
      redirect_to flats_path
    else
      render :edit
    end
  end

  def create
    @flat = Flat.new(flat_params)

    if @flat.save
      redirect_to flats_path, notice: "L'appartement a été ajouté avec succès."
    else
      render :new
    end
  end

  def delete_selected
    Flat.where(id: params[:flat][:selected_ids]).destroy_all
    redirect_to flats_path, notice: "Les appartements sélectionnés ont été supprimés avec succès."
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
    redirect_to flats_path, status: :see_other, notice: "L'appartement a été supprimé avec succès."
  end
private

def flat_params
  params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
end


end
