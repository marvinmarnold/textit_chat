class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :set_clients
  skip_before_filter :authenticate_user!, :only => :register_for_general_info

  layout "two_column"

  def index
    client_id = params[:client_id]

    if client_id
      @client = @clients.find(client_id)
    end

    respond_to do |format|
      format.html
      format.csv { render text: @clients.to_csv }
      format.xls
    end
  end

  def show
    redirect_to clients_path(client_id: @client.id)
  end

  def new
    @client = Client.new
  end

  def edit
  end

  def create
    @client = Client.new(client_params)
    @client.save
  end

  def update
    @client.update(client_params)
    redirect_to clients_path(client_id: @client.id)
  end

  def destroy
    @client.destroy
  end

  def register_for_general_info
    Client.register_for_general_info params
  end

  private
    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:phone_number, :name, :address, :lanague,
        :country, :confirmation_method, :normal_period_start_day,
        :termination_chosen, :informed_risks_pills, :informed_iud,
        :other_illness, :other_std, :previous_termination_attempt,
        :previous_termination_attempt_bleeding,
        :birthday, :has_unwanted, { :health_problem_ids => [] }, :num_children,
        :notes)
    end

    def set_clients
      @clients = Client.all
    end
end
