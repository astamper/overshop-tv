require 'open-uri'
require 'json'

task :load => :environment do
  @bbdb = Bestbuy.all
  @bbdb.destroy_all
  for page in 1..10 do
    url = "https://api.remix.bestbuy.com/v1/products((categoryPath.id=abcat0101000))?apiKey=#{ENV["BESTBUY_KEY"]}&pageSize=100&page=#{page}&format=json"
    result = open(url).read
    @parsed_result = JSON.parse(result)
    @parsed_result["products"].each_with_index do |var, index|
      @bbdb = Bestbuy.new
      @bbdb.name = @parsed_result["products"][index.to_i]["name"]
      @bbdb.imageurl = @parsed_result["products"][index.to_i]["largeImage"]
      @bbdb.brand = @parsed_result["products"][index.to_i]["manufacturer"]
      @bbdb.modelnumber = @parsed_result["products"][index.to_i]["modelNumber"]
      @bbdb.url = @parsed_result["products"][index.to_i]["url"]
      @bbdb.description = @parsed_result["products"][index.to_i]["longDescription"]
      @bbdb.width = @parsed_result["products"][index.to_i]["width"]
      @bbdb.depthwithstandin = @parsed_result["products"][index.to_i]["depthWithStandIn"]
      @bbdb.depthwithoutstandin = @parsed_result["products"][index.to_i]["depthWithoutStandIn"]
      @bbdb.heightwithstandin = @parsed_result["products"][index.to_i]["heightWithStandIn"]
      @bbdb.heightwithoutstandin = @parsed_result["products"][index.to_i]["heightWithoutStandIn"]
      @bbdb.customerreviewcount = @parsed_result["products"][index.to_i]["customerReviewCount"]
      @bbdb.customerreviewaverage = @parsed_result["products"][index.to_i]["customerReviewAverage"]
      @bbdb.tvtype = @parsed_result["products"][index.to_i]["tvType"]
      @bbdb.regularprice = @parsed_result["products"][index.to_i]["regularPrice"]
      @bbdb.saleprice = @parsed_result["products"][index.to_i]["salePrice"]
      @bbdb.save
      end
    end
  end

