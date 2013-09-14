require 'work_queue'
require 'chronic'
require 'nokogiri'
require 'open-uri'
module GithubApi
  class User
    attr_reader :name
    def initialize(user_name)
      @name = user_name
    end

    def get_list_of_followers
      wq = WorkQueue.new 5
      list = {}
      pages = get_number_of_followers_pages
      (1..pages).to_a.each do |i|
        wq.enqueue_b do
          list[i] = FollowersPage.new(name, i).followers_list
        end
      end
      wq.join
      list.values.flatten
    end

    def get_join_date
      Chronic.parse(Nokogiri::HTML(open("https://github.com/#{name}")).css('span.join-date').text)
    end

    def get_number_of_followers_pages
      (get_number_of_followers.to_f/51).ceil
    end

    def get_number_of_followers
      Nokogiri::HTML(open("https://github.com/#{name}/followers")).xpath('//*[@id="site-container"]/div[1]/div/ul/li/span/span/a[2]').text.gsub(/\,/,'').to_i
    end

    def get_number_of_commits
      Nokogiri::HTML(open("https://github.com/#{name}")).xpath('//*[@id="contributions-calendar"]/div[3]/div[1]/span[1]').text.split(' ').first.gsub(/\,/,'').to_i
    end
  end

  class FollowersPage
    attr_reader :name, :page
    def initialize(user_name, page_number)
      @name = user_name
      @page = page_number
    end

    def content
      @content ||= Nokogiri::HTML(open("https://github.com/#{name}/followers?page=#{page}"))
    end

    def follower_row(i)
      content.xpath("//*[@id='site-container']/div[2]/ol/li[#{i}]")
    end

    def follower_name(i)
      follower_row(i).children[1].attributes['href'].value.gsub(/\//,'')
    end

    def follower_exists?(i)
      follower_row(i).to_ary != []
    end

    def followers_list
      i, list = 1, []
      while follower_exists?(i)
        list << follower_name(i)
        i += 1
      end
      list
    end
  end
end
