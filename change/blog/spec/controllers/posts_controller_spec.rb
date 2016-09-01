require 'rails_helper'


RSpec.describe PostsController, type: :controller do

  it "render_index_posts not login" do
    get :index
    expect(response).to render_template("index")
  end

  it "loads all posts not login" do
    post1, post2 = Post.create!, Post.create!
    get :index
    expect(assigns(:posts)).to match_array([post1, post2])
  end

  it "render_show_post not login" do
    post1 = Post.create!
    get :show, {id: 1}
    expect(response).to render_template("show")
  end

  it "render_edit if loggined" do
      user = FactoryGirl.create :user
      login(user)
      post = FactoryGirl.create :post
      post.user_id = user.id
      post.save
      get :edit, {id: post.id}
      expect(response).to render_template("edit")
  end

  it "update_post if loggined" do
    user = FactoryGirl.create :user
    login(user)
    post = FactoryGirl.create :post
    post.user_id = user.id
    post.save
    params = {post: {title: 'Tets', content: 'Content test'}, id: post.id}
    put "update", params
    expect(response).to redirect_to(assigns(:post))
  end

  it "render_show_new if loggined" do
    login(FactoryGirl.create :user)
    get :new
    expect(response).to render_template("new")
  end

  it "destroy_post if login " do
   user = FactoryGirl.create :user
   login(user)
   post = FactoryGirl.create :post
   post.user_id = user.id
   post.save
   delete :destroy, {id: post.id}
   expect(response).to redirect_to posts_path
 end

 it "destroy_post if login where count post = 0  " do
   user = FactoryGirl.create :user
   login(user)
   post = FactoryGirl.create :post
   post.user_id = user.id
   post.save
   delete :destroy, {id: post.id}
   expect(Post.count).to eq(0)
 end

  it "create_post if loggined" do
    user = FactoryGirl.create :user
    login(user)
    params = {post: {title: 'Title', content: 'Content'}}
    post :create, params
    expect(response).to redirect_to(assigns(:post))
  end

  # it do
  #   should route(:get, '/posts').to(controller: :posts)
  #   end

  # it do
  #   post = Post.new
  #   post.save
  #   should route(:get, '/posts/1').to('posts#show', id: post.id)
  #   end

  # describe 'Get #show' do
  #   before {get :show}

  #   it {should render_template(:index)}
  #   it {should render_template(partial: '_header')}
  # end


end
