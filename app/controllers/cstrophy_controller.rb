class CstrophyController < ApplicationController
    before_action :authenticate_user!
    def index
        @batches = BatchPoints.order(points: :desc)
    end

    def create
        params.permit(:batch_name, :points)
        @batch = BatchPoints.find_by(batch_name: params[:batch_name])
        if @batch
            @batch.points += params[:points].to_i
            @batch.save
        else
            BatchPoints.create(
                batch_name: params[:batch_name],
                points: params[:points]
            )
        end
        redirect_to cstrophy_index_path, notice: 'Batch points updated successfully!'
    end
end