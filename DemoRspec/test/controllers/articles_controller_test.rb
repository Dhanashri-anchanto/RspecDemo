class ArticlesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:articles)
  end

#   test "should create article" do
#   assert_difference('Article.count') do
#     post :create, article: {title: 'Some title'}
#   end
 
#   assert_redirected_to article_path(assigns(:article))
# end


test "index should render correct template and layout" do
  get :index
  assert_template :index
  assert_template layout: "layouts/application"
end

test "new should render correct layout" do
  get :new
  assert_template layout: "layouts/application", partial: "_form"
end

test "should create article" do
  assert_difference('Article.count') do
    post :create, article: {title: 'Hi', body: 'This is my first article.'}
  end
  assert_redirected_to article_path(assigns(:article))
  assert_equal 'Article created successfully.', flash[:notice]
end
end