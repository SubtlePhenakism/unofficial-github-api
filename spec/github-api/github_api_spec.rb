require 'spec_helper'

describe 'GithubApi User' do
  before(:all) do
    @grigorik = GithubApi::User.new('igrigorik')
    @max = GithubApi::User.new('mac-r')
    @robert = GithubApi::User.new('SubtlePhenakism')
  end

  it 'should get number of commits' do
    @grigorik.commits_size.should == 0
  end

  it 'should get number of followers' do
    @grigorik.followers_size.should == 2961
  end

  it 'should get number of followers pages' do
    @grigorik.get_number_of_followers_pages.should == 59
    @max.get_number_of_followers_pages.should == 1
  end

  it 'should get list of followers' do
    @max.followers.should == ["bobuz", "attractor-bot", "SubtlePhenakism", "alexalv", "guiferrpereira", "s0ber", "targence", "Pistol92", "denova", "Virakocha", "drinkius"] 
  end

  it 'should get join date' do
    @grigorik.created_at.should == Time.new(2008,5,17, 12)
    @max.created_at.should == Time.new(2011,10,1, 12)
  end
end

describe 'GithubApi FollowersPage' do
  before(:all) do
    @grigorik = GithubApi::FollowersPage.new('igrigorik', 1)
  end

  it 'should check if follower exists' do
    @grigorik.follower_exists?(1).should == true
    @grigorik.follower_exists?(100).should == false
  end

  it 'should get a nickname of the first follower' do
    @grigorik.follower_name(1).should == 'agios'
  end

  it 'should return followers list per page' do
    @grigorik.followers_list.should == ["agios", "rohitnjan88", "zhangyuan", "meganemura", "dlackty", "samgranieri", "glebm", "shokr", "kuus", "irazasyed", "zuyu", "grey93", "ovis35", "Blake-C", "kewinwang", "nadiavasconcelos", "GabrielDuque5", "corangar", "elithrar", "davidyuan1989", "dynamicy", "vmitchell", "geymed", "dritter", "atishn", "emmanuelgautier", "AndrewHYi", "JoshuaJBerk", "AddaxSoft", "sergiobuj", "zzgary", "jwachter", "joginder89", "chengjun", "partloer", "akaomy", "yankuangshi", "geaden", "ricsirigu", "bharadwaj6", "soenmie", "cgyy", "openhiun", "mlarraz", "fbgt", "treble37", "ninproj", "guifreitag", "fixnum", "astroboyrgukt", "simongfxu"]
    GithubApi::FollowersPage.new('igrigorik', 1000).followers_list.should == []
  end
end
