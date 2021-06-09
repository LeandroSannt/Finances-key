namespace :dev do
desc "TODO"
  task setup: :environment do
    if Rails.env.development?
        show_spinner("Apagando BD..."){%x(rails db:drop)}
        show_spinner("Criando BD..."){%x(rails db:create)}
        show_spinner("Migrando BD..."){%x(rails db:migrate)}
        show_spinner("Adicionando do usuario padrao.."){%x(rails dev:add_default_user)}
        show_spinner("Adicionando do categoria padrao.."){%x(rails dev:add_default_category)}
        show_spinner("Adicionando do transação padrao.."){%x(rails dev:add_default_transaction)}

    else
        puts "Voce não esta no ambiente de desenvolvimento!"    
  end
end 

desc "Adicionar o usuario padrão"
  task add_default_user: :environment do
    User.create!(
      email:"admin@admin.com",
      password: 123456,
      password_confirmation: 123456
  )
  end

desc "Adicionar o categoria padrão"
  task add_default_category: :environment do
    Category.create!(
      name_category:"Entradas",
      priority: "green",
      user_id: 1

    )
  end

  desc "Adicionar o transacao padrão"
  task add_default_transaction: :environment do
    Transaction.create!(
      name_transaction:"Salario",
      value: 1500,
      situation: false,
      date_transaction: Date.today,
      category_id: 1,
      user_id: 1
    )
  end


  private
    def show_spinner(msg_start, msg_end = "Concluido!")
      spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
      spinner.auto_spin
      yield
      spinner.success("(#{msg_end})")
    end
  end
