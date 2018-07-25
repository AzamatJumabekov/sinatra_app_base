# frozen_string_literal: true

settings.configure do
  set :server, %w[thin mongrel webrick]
  set :public_folder, (proc { File.join(App.root, 'public') })
  set :logging, true
  set :show_exceptions, false
end
