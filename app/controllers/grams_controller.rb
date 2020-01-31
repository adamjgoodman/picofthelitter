class GramsController < ApplicationController
	before_action :get_breeds

	def index
		if params[:query]
			@grams = Gram.where(breed: params[:query])
		else
			@grams = Gram.all
		end
	end

	def new
		@gram = Gram.new
	end

	def create
		@gram = current_user.grams.create(gram_params)
		if @gram.valid?
			redirect_to root_path
		else
			render :new, status: :unprocessable_entity
		end
	end

	def show
		@gram = Gram.find_by_id(params[:id])
		return render_not_found if @gram.blank?
		@comments = @gram.comments.order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
	end

	def edit
		@gram = Gram.find_by_id(params[:id])
		return render_not_found if @gram.blank?
		return render_not_found(:forbidden) if @gram.user != current_user unless current_user.username == "atom"
	end

	def update
		@gram = Gram.find_by_id(params[:id])
		return render_not_found if @gram.blank?
		return render_not_found(:forbidden) if @gram.user != current_user unless current_user.username == "atom"
		@gram.update_attributes(gram_params)
		if @gram.valid?
			redirect_to root_path
		else
			return render :edit, status: :unprocessable_entity
		end
	end

	def destroy
		@gram = Gram.find_by_id(params[:id])
		return render_not_found if @gram.blank?
		return render_not_found(:forbidden) if @gram.user != current_user
		@gram.destroy
		redirect_to root_path
	end

	def get_breeds
		@breeds = []

		CSV.foreach('app/assets/breeds/breeds.csv', encoding: 'iso-8859-1:utf-8') do |row|
			@breeds << row
		end
	end

private

	def gram_params
		params.require(:gram).permit(:message, :picture, :breed)
	end

end
