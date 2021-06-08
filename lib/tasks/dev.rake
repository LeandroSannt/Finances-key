namespace :dev do
desc "TODO"
  task setup: :environment do
    if Rails.env.development?
        show_spinner("Apagando BD..."){%x(rails db:drop)}
        show_spinner("Criando BD..."){%x(rails db:create)}
        show_spinner("Migrando BD..."){%x(rails db:migrate)}
        show_spinner("Adicionando do usuario padrao.."){%x(rails dev:add_default_user)}
        show_spinner("Adicionando do categoria padrao.."){%x(rails dev:add_default_category)}

    else
        puts "Voce não esta no ambiente de desenvolvimento!"    
  end
end 

desc "Adicionar o usuario padrão"
  task add_default_user: :environment do
    User.create!(
      email:"lsn_slim@yahoo.com.br",
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


  private
    def show_spinner(msg_start, msg_end = "Concluido!")
      spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
      spinner.auto_spin
      yield
      spinner.success("(#{msg_end})")
    end
  end
