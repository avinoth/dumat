namespace :initialize do
  task languages: [:environment] do
    token = ENV["KIMONO_TOKEN"]
    url = ENV["KIMONO_URL"] + '?apikey=' + token
    resp = HTTParty.get(url).as_json
    resp["results"]["languages"].each do |lang|
      name = lang["name"]["text"]
      Language.create(name: name)
      puts "Created Language #{name}"
    end
  end
end
