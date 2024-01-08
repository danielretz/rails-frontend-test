class ReasonsController < ApplicationController
  before_action :set_reason, only: %i[ show edit update destroy ]
  before_action :set_storefront, only: %i[new show edit create update]

  # GET /reasons/1 or /reasons/1.json
  def show
  end

  # GET /reasons/new
  def new
    @reason = Reason.new
  end

  # GET /reasons/1/edit
  def edit
  end

  # POST /reasons or /reasons.json
  def create
    @reason = Reason.new(reason_params)

    respond_to do |format|
      if @reason.save
        format.turbo_stream { render turbo_stream: turbo_stream.replace("storefront-reasons", partial: "storefronts/reason_list", locals: { storefront: @reason.storefront }) }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reason.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reasons/1 or /reasons/1.json
  def update
    respond_to do |format|
      if @reason.update(reason_params)
        format.turbo_stream { render turbo_stream: turbo_stream.replace("storefront-reasons", partial: "storefronts/reason_list", locals: { storefront: @reason.storefront }) }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reason.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reasons/1 or /reasons/1.json
  def destroy
    @storefront = @reason.storefront
    @reason.destroy!

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace("storefront-reasons", partial: "storefronts/reason_list", locals: { storefront: @storefront }) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reason
      @reason = Reason.find(params[:id])
    end

    def set_storefront
      @storefront = Storefront.find(params[:storefront_id] || reason_params[:storefront_id])
    end

    # Only allow a list of trusted parameters through.
    def reason_params
      params.fetch(:reason, {}).permit(:active, :code, :label, :ordering, :storefront_id)
    end
end
