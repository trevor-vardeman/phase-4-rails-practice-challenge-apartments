class LeaseController < ApplicationController

  def create
    lease = Lease.create(tenant_params)
    if lease.valid?
      render json: lease, status: :created
    else
      render json: { errors: lease.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    lease = Lease.find_by(id: params[:id])
    if lease
      apartme
      head :no_content
    else
      render json: { errors: lease.errors.full_messages }, status: :not_found
    end
  end

end