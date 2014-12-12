namespace :seed do
  desc "Seeds DB with predefines FAQs"
  task faqs: :environment do
    {
      "" => "",
    }
  end

  desc "Seeds DB with random users, chats, and orders"
  task users_chats_orders: :environment do
    {
      "marvinmarnold@gmail.com" => "marvinsafe2choose",
      "rodrigo@dktinternational.org" => "rodrigosafe2choose"
    }.each do |k, v|
      u = User.create!(email: k, password: v)
      20.times do
        from = rand(10000000000)
        client = Client.create!(phone_number: from)
        chat = u.chats.create!(client: client)


        #Create orders
        if rand < 0.5
          o = u.orders.create!(client: client, subtotal: 100, shipping: 10, taxes: 5)
        end

        # Create messages
        rand(20).times do
          if rand < 0.5
            chat.messages.create!(from: from, to: Message.system_sms_phone_number, message: Faker::Lorem.sentence, sent: true, sent_at: Time.zone.now)
          else
            chat.messages.create!(to: from, from: Message.system_sms_phone_number, message: Faker::Lorem.sentence, sent: true, sent_at: Time.zone.now)
          end
        end
      end
    end
  end

end
