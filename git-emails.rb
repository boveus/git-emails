require 'json'
require 'uri'
require 'pry'
require 'net/http'

user = ARGV[0].to_s

emails = {}

uri = URI("https://api.github.com/users/#{user}/repos")
res = Net::HTTP.get_response(uri)
if res.is_a?(Net::HTTPSuccess)
    JSON.parse(res.body).each do |repo|
        commits_uri = repo["commits_url"].split("{").first
        uri = URI(commits_uri)
        res = Net::HTTP.get_response(uri)
        next unless res.is_a?(Net::HTTPSuccess)
        JSON.parse(res.body).each do |response|
            email = response["commit"]["author"]["email"]
            name = response["commit"]["author"]["name"]
            emails[email] = name
            email = response["commit"]["committer"]["email"]
            name = response["commit"]["committer"]["name"]
            emails[email] = name
        end
    end
else
    puts res.body
    puts "Error making request"
end

binding.pry 

puts emails
