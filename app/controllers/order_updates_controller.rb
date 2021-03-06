class OrderUpdatesController < ApplicationController
  def create
    o = current_user.orders.find(params[:order_id])

    if o
      up = current_user.order_updates.where(order_id: o.id).first
      up.update_attributes(order_update_params)
      up.order_id = o.id

      if up.save
        o.confirm_payment
        redirect_to orders_path(order_id: o.id), notice: 'Order payment was confirmed.'
      else

      end
    else
      redirect to: orders_path
    end
  end

private

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_update_params
    params.require(:order_update).permit(:confirmation_code)
  end
end
