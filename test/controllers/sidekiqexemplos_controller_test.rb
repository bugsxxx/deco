require 'test_helper'

class SidekiqexemplosControllerTest < ActionController::TestCase
  setup do
    @sidekiqexemplo = sidekiqexemplos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sidekiqexemplos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sidekiqexemplo" do
    assert_difference('Sidekiqexemplo.count') do
      post :create, sidekiqexemplo: { codigo: @sidekiqexemplo.codigo, tipo: @sidekiqexemplo.tipo }
    end

    assert_redirected_to sidekiqexemplo_path(assigns(:sidekiqexemplo))
  end

  test "should show sidekiqexemplo" do
    get :show, id: @sidekiqexemplo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sidekiqexemplo
    assert_response :success
  end

  test "should update sidekiqexemplo" do
    patch :update, id: @sidekiqexemplo, sidekiqexemplo: { codigo: @sidekiqexemplo.codigo, tipo: @sidekiqexemplo.tipo }
    assert_redirected_to sidekiqexemplo_path(assigns(:sidekiqexemplo))
  end

  test "should destroy sidekiqexemplo" do
    assert_difference('Sidekiqexemplo.count', -1) do
      delete :destroy, id: @sidekiqexemplo
    end

    assert_redirected_to sidekiqexemplos_path
  end
end
