require "sinatra"
require "sinatra/reloader"
require "http"
require "json"
require "date"


get("/") do
  date = Time.now.strftime("%a %e, %R %p")
  @now = date.to_s


 erb(:homepage)
end

get("/prediction") do

emoji = HTTP.get("https://emojihub.yurace.pro/api/all/category/animals-and-nature")
emoji_string = JSON.parse(emoji.to_s)
random_emoji = response_string.sample
@html = random_emoji.fetch("htmlCode")

advice_url = HTTP.get("https://api.adviceslip.com/advice")
advice_data = JSON.parse(advice_url).fetch("slip")
@advice = advice_data.fetch("advice")


erb(:prediction)
end
