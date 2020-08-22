Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'csv_sender#welcome'
  get  'upload_file', to: 'csv_sender#upload_file'
  post  'sender', to: 'csv_sender#sender'
end
