class Admin::RequestsController < ApplicationController
  before_action :load_request, only: [:update]

  def index
    @requests = Request.order(created_at: :DESC).paginate page: params[:page], per_page: 5
  end

  def update
    if params[:request][:status] == "accept"
      @request.update_attributes Status: 1
    else
      @request.update_attributes Status: 2
    end
    flash[:success] = "Update request's status success"
    redirect_to admin_requests_url
  end

  private

    def request_params
      params.request(:request).permit :Status
    end

    def load_request
      @request = Request.find_by id: params[:id]
      if @request.nil?
        flash[:danger] = "cannot find request"
        redirect_to admin_requests_url
      end
    end
end
