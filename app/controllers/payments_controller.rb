class PaymentsController < ApplicationController
  def cancel
  end

  def success
  end

  #самая сложная часть
  # Самая сложная часть контроллера.

  def notify

    filtered_params = params

    filtered_params.delete(:action)

    filtered_params.delete(:controller)

    filtered_params[:cmd] = '_notify-validate'

    # Проверяем, от кого пришел ответ - точно от PayPal или нет

    response = Faraday.post 'https://www.paypal.com/cgi-bin/webscr', filtered_params

    response_body = response.body

    # Если удалось, то сохраняем операцию как обработанную, иначе как не обработанную

    if response_body == 'VERIFIED'

      # Если отмена платежа, просто подтверждаем

      if params[:payment_status].to_s == 'Refunded'

        render text: 'OK'

        return

      end

      # Проверяем e-mail получателя платежа

      if params[:receiver_email] != "m19804@yandex.ru"

        render text: 'OK'

        return

      end

      if  params[:txn_type] != 'web_accept'

        render text: 'OK'

        return

      end

      # Ищем заказ

      order = Order.find params[:item_number]

      # Проверяем сумму

      if order.price >= params[:mc_gross].to_f || params[:mc_currency] != 'RUB'

        render text: 'OK'

        return

      end

      if order.status == 'paid'

        render text: 'OK'

        return

      end

      order.update status: 'paid'

      # @todo Также отправить письмо об оплате

    end

    render text: 'OK'

  end

end


def notify
end

