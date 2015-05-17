require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ClassNamesController do

  # This should return the minimal set of attributes required to create a valid
  # ClassName. As you add validations to ClassName, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ClassNamesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all class_names as @class_names" do
      class_name = ClassName.create! valid_attributes
      get :index, {}, valid_session
      assigns(:class_names).should eq([class_name])
    end
  end

  describe "GET show" do
    it "assigns the requested class_name as @class_name" do
      class_name = ClassName.create! valid_attributes
      get :show, {:id => class_name.to_param}, valid_session
      assigns(:class_name).should eq(class_name)
    end
  end

  describe "GET new" do
    it "assigns a new class_name as @class_name" do
      get :new, {}, valid_session
      assigns(:class_name).should be_a_new(ClassName)
    end
  end

  describe "GET edit" do
    it "assigns the requested class_name as @class_name" do
      class_name = ClassName.create! valid_attributes
      get :edit, {:id => class_name.to_param}, valid_session
      assigns(:class_name).should eq(class_name)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new ClassName" do
        expect {
          post :create, {:class_name => valid_attributes}, valid_session
        }.to change(ClassName, :count).by(1)
      end

      it "assigns a newly created class_name as @class_name" do
        post :create, {:class_name => valid_attributes}, valid_session
        assigns(:class_name).should be_a(ClassName)
        assigns(:class_name).should be_persisted
      end

      it "redirects to the created class_name" do
        post :create, {:class_name => valid_attributes}, valid_session
        response.should redirect_to(ClassName.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved class_name as @class_name" do
        # Trigger the behavior that occurs when invalid params are submitted
        ClassName.any_instance.stub(:save).and_return(false)
        post :create, {:class_name => { "name" => "invalid value" }}, valid_session
        assigns(:class_name).should be_a_new(ClassName)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        ClassName.any_instance.stub(:save).and_return(false)
        post :create, {:class_name => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested class_name" do
        class_name = ClassName.create! valid_attributes
        # Assuming there are no other class_names in the database, this
        # specifies that the ClassName created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        ClassName.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => class_name.to_param, :class_name => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested class_name as @class_name" do
        class_name = ClassName.create! valid_attributes
        put :update, {:id => class_name.to_param, :class_name => valid_attributes}, valid_session
        assigns(:class_name).should eq(class_name)
      end

      it "redirects to the class_name" do
        class_name = ClassName.create! valid_attributes
        put :update, {:id => class_name.to_param, :class_name => valid_attributes}, valid_session
        response.should redirect_to(class_name)
      end
    end

    describe "with invalid params" do
      it "assigns the class_name as @class_name" do
        class_name = ClassName.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ClassName.any_instance.stub(:save).and_return(false)
        put :update, {:id => class_name.to_param, :class_name => { "name" => "invalid value" }}, valid_session
        assigns(:class_name).should eq(class_name)
      end

      it "re-renders the 'edit' template" do
        class_name = ClassName.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ClassName.any_instance.stub(:save).and_return(false)
        put :update, {:id => class_name.to_param, :class_name => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested class_name" do
      class_name = ClassName.create! valid_attributes
      expect {
        delete :destroy, {:id => class_name.to_param}, valid_session
      }.to change(ClassName, :count).by(-1)
    end

    it "redirects to the class_names list" do
      class_name = ClassName.create! valid_attributes
      delete :destroy, {:id => class_name.to_param}, valid_session
      response.should redirect_to(class_names_url)
    end
  end

end
