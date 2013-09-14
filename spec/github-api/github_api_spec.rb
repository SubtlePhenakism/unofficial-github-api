require 'spec_helper'

describe 'GithubApi User' do
  before(:all) do
    @grigorik = GithubApi::User.new('igrigorik')
    @max = GithubApi::User.new('mac-r')
  end

  it 'should get number of commits' do
    @grigorik.commits_size.should == 229
  end

  it 'should get number of followers' do
    @grigorik.followers_size.should == 2217
  end

  it 'should get number of followers pages' do
    @grigorik.get_number_of_followers_pages.should == 44
    @max.get_number_of_followers_pages.should == 1
  end

  it 'should get list of followers' do
    @max.followers.should == ['s0ber', 'targence', 'kossnocorp', 'Pistol92', 'denova', 'Virakocha', 'drinkius']
  end

  it 'should get join date' do
    @grigorik.created_at.should == Time.new(2008,5,17, 12)
    @max.created_at.should == Time.new(2011,10,1, 11)
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
    @grigorik.follower_name(1).should == 'confa'
  end

  it 'should return followers list per page' do
    @grigorik.followers_list.should == ['confa', 'sainavaneethan', 'nano-monkey', 'shokai', 'pid', 'pielgrzym', 'deanhume', 'mohnish', 'mdi', 'delqn', 'emohacker', 'leoj3n', 'florinbroasca', 'guypod', 'mahinshaw', 'yuyay', 'jonathanchrisp', 'xinhui', 'code6', 'riywo', 'vieten', 'hugoabonizio', 'KevinQiangK', '9minds', 'ice-melon', 'danzajdband', 'umitunal', 'technommy', 'yuanyan', 'nadavhollander', 'peterood', 'rubymerchant', 'choppen5', 'hxgdzyuyi', 'rsaccoll', 'kostyantyn', 'grauwoelfchen', 'mirosr', 'ivalkeen', 'robwilliams', 'rogerjnak', 'sdeguardi', 'wyg1258', 'waibo', 'vitoleandro', 'aaronjwood', 'samsonradu', 'jaspervalero', 'nwokeo', 'wangshijun2010', 'bradberger']
    GithubApi::FollowersPage.new('igrigorik', 1000).followers_list.should == []
  end
end
